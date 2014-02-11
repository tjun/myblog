---
layout: post
category:
title: capistranoでデプロイ
date: 2014-02-11
description:
keywords: blog, capistrano
---

このblogは[jekyll](https://github.com/jekyll/jekyll)を使って作っているんだけど、今までは手元でビルドしてからサーバへrsync使ってアップロードしてました。
`rake rsync` とやると、アップロードできるようにしてた。

この数日風邪で寝込んでいて暇だったので、勉強を兼ねてデプロイに[capistrano](https://github.com/capistrano/capistrano)を使うようにしました。

capistranoというのはいわゆるデプロイツールと言われるやつで、デプロイの作業を自動化するためのツールです。
rubyだとcapistranoを使うのが普通らしい。capistranoが設定をrubyで書けるというだけで、扱うファイルの言語はなんでもよいです。以前はシェルスクリプト書いてやっていたようなことを、capistranoの設定を書くことで実現できます。

今capistranoはver.3 になっているので、[入門 Capistrano 3 ~ 全ての手作業を生まれる前に消し去りたい | GREE Engineers' Blog](http://labs.gree.jp/blog/2013/12/10084/) を参考にしました。[公式のドキュメント](http://capistranorb.com/)も少し読みました。

アップロードするだけだとrsyncでやっていたことと変わらないので、アップロードする前にjekyllのビルドが自動的に走るようにしたり、tar.gzで固めてアップロードするようにしたり、アップロード後のトップページを[nokogiri](https://github.com/sparklemotion/nokogiri)でパースしてちゃんと新しい記事が反映されているか見えるようにしたりしています。

config/deploy.rbは次のような感じ。
ドキュメントをちゃんと読めていないので、この書き方が正しいのかわかってないですが、一応ちゃんと動いてます。
本来はcapistranoのデフォルトタスクに合わせるべきだと思うのですが、裏で何が動くのかまだよくわからないのが嫌で、全部clearして自分で書いてます。

{% highlight ruby linenos %}
# config valid only for Capistrano 3.1
lock '3.1.0'

set :application,       'tjun.org'
set :scm,               :git
set :deploy_via,        :copy
set :copy_compression,  :gzip
set :use_sudo,          false

set :user,      'tjun'
set :group,     'tjun'
set :tmp,       '/tmp'
set :deploy_to, '/var/www/tjun.org'
set :source,    '_site'
set :archive_name, 'site.tar.gz'
set :url,       'http://tjun.org'

# delete default tasks
framework_tasks = [:starting, :started, :updating, :updated, :publishing, :published, :finishing, :finished]

framework_tasks.each do |t|
    Rake::Task["deploy:#{t}"].clear
end

Rake::Task[:deploy].clear


task :update do
  desc 'Run jekyll to update site before uploading'
  run_locally do
    source = fetch :source
    archive_name = fetch :archive_name
    if test "[ -d #{source} ]"
      execute "rm -rf #{source}/*"
    else
      error "You are in wrong directory?"
      raise "in wrong dir"
    end
    if test "[ -e #{archive_name} ]"
      execute "rm -f #{archive_name}"
    end
    execute "jekyll build"
    info "build jekyll finished"
  end
end

task :archive => :update do
  desc 'archive file in tar.gz'
  run_locally do
    source = fetch :source
    archive_name = fetch :archive_name

    execute "tar zcf #{archive_name} #{source}"
    info "create #{archive_name}"
  end
end

task :deploy => :archive do
  archive_file = fetch :archive_name
  deploy_to = fetch :deploy_to
  tmp = fetch :tmp
  source = fetch :source

  on roles(:web) do
    begin
      execute "rm -rf #{deploy_to}/*"
    rescue => e
      info "No previous release exists"
    end

    upload! archive_file, tmp
    execute "cd #{tmp} && tar zxf #{archive_file} && mv #{source}/* #{deploy_to} && ls #{deploy_to}"
  end
end

task :check do
  desc 'check recent post uploaded'
  url = fetch :url
  run_locally do
    info 'show recent posts on toppage'
    html = Nokogiri::HTML(open(url))
    html.css("li").css("a").each do |l|
      if l.attr("href").slice(1,4) == "blog"
        unless l.attr("href").slice(-3,3) == "rss"
          puts l
        end
      end
    end
  end
end

task :cleanup do
  source = fetch :source
  archive_name = fetch :archive_name
  run_locally do
    execute "rm -rf #{source}/*"
    execute "rm -f #{archive_name}"
  end
end

after 'deploy', 'check'
after 'check', 'cleanup'

{% endhighlight %}
