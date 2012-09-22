---
layout: post
status: publish
published: true
title: 15時にtwitterにギャグを投げるプログラムをRubyで
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 405
wordpress_url: http://zzz.jeeet.net/?p=248
date: 2009-01-09 03:28:31.000000000 +09:00
categories:
- ubuntu
- ruby
- twitter
tags:
- twitter
- ruby
comments:
- id: 90
  author: twitterのダイレクトメッセージを受信するプログラムをrubyで | ふじゅんブログ
  author_email: ''
  author_url: http://tjun.jp/blog/2009/01/twitter_receive_dm_by_ruby/
  date: '2009-01-15 03:13:21 +0900'
  date_gmt: '2009-01-14 18:13:21 +0900'
  content: ! '[...] 15時にtwitterにギャグを投げるプログラムをRubyで  [...]'
---
<div class="zemanta-img" style="margin: 1em; float: right; display: block;">
<div><dl class="wp-caption"> <dt class="wp-caption-dt"><img src="http://www.crunchbase.com/assets/images/resized/0000/2755/2755v2-max-450x450.png" alt="Image representing Twitter as depicted in Crun..." title="Image representing Twitter as depicted in Crun..." width="210" height="49" /></dt> <dd class="wp-caption-dd zemanta-img-attribution" style="font-size: 0.8em;">Image via CrunchBase</dd> </dl></div>
</div>
<strong>--- 2010/07/09 追記---

以前かいたプログラムを修正したので、それを乗せておきます。
古いプログラムで使っていたライブラリがいまいちなので、少し違います。</strong>

<strong>あと、今後のことを考えるとOauth認証にしないとです。
</strong>

[ruby]
require('time')
require 'rubygems'
require 'twitter'

#twitter conf
username = 'username'
password = 'password'

httpauth = Twitter::HTTPAuth.new(username, password)
client = Twitter::Base.new(httpauth)

lines = 0

msg = nil

open(&amp;quot;/user/tjun/work/twitter/subetter/jokes.txt&amp;quot;){|file|
 while tmp = file.gets
 lines += 1
 end
}

open(&amp;quot;/user/tjun/work/twitter/subetter/jokes.txt&amp;quot;){|file|
　 msg = file.readlines[rand(lines)].chomp
　 #print msg
}

client.update(msg)
[/ruby]

<strong>-----ここまで追記-----</strong>

Rubyの勉強をちょっと昨日から始めたので，練習にtwitterにギャグをPostするプログラムを書いてみました．
<h2><span style="text-decoration: underline;"><span style="color: #0000ff;"><strong><a href="http://twitter.com/subetter">subetter</a></strong></span></span></h2>
1日1回ということでそんなにうざくないので，せっかくだからフォローしてやってください．

[ad]

これを作るためにやることは
<ul>
	<li>1行に１つギャグを書いたテキストファイルを作る</li>
	<li>テキストファイルをランダムで1行読む</li>
	<li>それをtwitterにポストする</li>
	<li>それをcronで1日1度実行する</li>
</ul>
っていう簡単なお仕事．

まず，ギャグを書いたテキストを作ります．
これは，いい方法が思いつかなかったのでとりあえずネットで適当に集めてきて自分でテキストファイルを作りました．まだギャグが30くらいしかない．さびしい．

で，それをランダムで1行読むっていうのは簡単だけど，twitterにpostするにはどうすればいいのかなって思って調べてみると，

<a href="http://d.hatena.ne.jp/riverlevee/20081209/1228811395/">twitterでbotを作りたい．(2) - reverleveeの日記</a>
という，ほとんど同じことをやっている方を見つけたので，それを参考にさせてもらった．というか，最初からこれを拝借すれば早かったな．

ということで，自分の汚いコードは捨てて，その人のプログラムをコピペしたプログラムがこちら．
subetter.rb

[ruby]
require('time')
require('rubygems')
gem('twitter4r','0.3.0')
require('twitter')

lines = 0

msg = nil

open(&amp;amp;amp;quot;jokes.txt&amp;amp;amp;quot;){|file|
while tmp = file.gets
lines += 1
end
}

open(&amp;amp;amp;quot;home/user/....../jokes.txt&amp;amp;amp;quot;){|file|
#ファイルのパスは絶対パスで書かないとcronで読み込むときに失敗します
msg = file.readlines[rand(lines)]
# print msg
}

client =Twitter::Client.new(:login =&amp;amp;amp;gt; 'subetter',:password =&amp;amp;amp;gt; 'password')
client.status(:post, msg)
exit
[/ruby]


jokes.txtにギャグを書きこみます．

文字化けは文字コードが原因なので，UTF-8で統一するように．

で、定期的にポストするには，Linuxの場合
<pre>crontab -e</pre>
でcronを設定することができます．
<pre># m h dom mon dow command
00 15 * * * ruby /home/user/......../ruby/subetter.rb</pre>
これで毎日15時にギャグをつぶやきます．

次は，他の人がギャグを登録できるようにすることと，つっこみ側も作って2つで漫才を行うことを考えている．
<div class="zemanta-pixie" style="margin-top: 10px; height: 15px;"><img src="http://img.zemanta.com/reblog_e.png?x-id=1da95bdf-9596-4f8b-892d-9ae9efbf177c" alt="Reblog this post [with Zemanta]" class="zemanta-pixie-img" style="border: medium none; float: right;" /></div>
