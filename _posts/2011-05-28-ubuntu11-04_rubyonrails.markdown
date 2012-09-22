---
layout: post
status: publish
published: true
title: Ubuntu11.04でrails
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 810
wordpress_url: http://tjun.jp/blog/?p=810
date: 2011-05-28 10:11:17.000000000 +09:00
categories:
- programming
- ubuntu
- ruby
tags:
- ruby
- ubuntu
- rails
comments: []
---
今までrubyは使ってたけどrailsは使ったことなかったので、少し勉強を始めました。

ubuntuのaptでgemを入れると、最新のものが使えなかったりしていろいろハマるので、別にいれた方がよさそうです。

また、railsのバージョンも2.xと3.xでいろいろ違うみたいなので、今回は両方の環境を入れてrvmで切り替えられるようにします。

参考にしたのは
<ul>
	<li><a href="http://michae1a.wordpress.com/2011/05/12/ruby-on-rails-on-ubuntu-11-04/">Ruby on Rails on Ubuntu 11.04 | 嘘つき女</a></li>
</ul>
です。

関連するパッケージなどをインストール。
<pre>
$ sudo apt-get install gcc build-essential
$ sudo apt-get install bison byacc gperf zlib1g-dev libssl-dev
$ sudo apt-get install libreadline5 libreadline5-dev libncurses5 libncurses5-dev sqlite3 libsqlite3-dev curl
</pre>

rvm(Ruby Version Manager)を入れる。
URLが変わっているかもしれないので、その時は<a href="https://rvm.beginrescueend.com/rvm/install/">RVM: Ruby Version Manager - Installing RVM</a>を確認。
<pre>
$ bash < <(curl -s https://rvm.beginrescueend.com/releases/rvm-install-head )
</pre>

次に、.bashrcなどに以下を追加してログインしなおす。
<pre>
# This loads RVM into a shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
</pre>


ここから、rvmを使ってrubyなどをインストールしていきます。
rubyは1.8xや1.9xを入れます。

<pre>
$ rvm install 1.8.7
$ rvm install 1.9.1
$ rvm default use 1.8.7
切り替えは
$ rvm use 1.9.1
</pre>

railsは2.3xや3.0xを入れてみます。
railsの切り替えのために、rails2とrails3というgemsetを作ります。
また、rails3をそのまま入れるとエラーが出るので、その前にgemを少し入れます。

<pre>
$ rvm gemset create rails2
$ rvm gemset create rails3
$ rvm gemset use rails2
$ gem install rails -v 2.3.11
$ rvm gemset use rail3
$ gem install hoe
$ gem install rdoc-data
$ gem install rails -v 3.0.7

切り替えは、
$ rvm gemset use rail2
$ rvm gemset use rail3
$ rvm gemset use global
</pre>

最初からglobalっていうgemsetがあるから、共通するgemはこれに入れるべきっぽい。

まあ、とりあえずrubyとrailsが入って、異なるバージョンが切り替えられるようになりました。
