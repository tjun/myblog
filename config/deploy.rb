# config valid only for Capistrano 3.1
lock '3.1.0'

set :application,       'tjun.org'
set :repo_url,          'git@github.com:tjun/myblog.git'
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
