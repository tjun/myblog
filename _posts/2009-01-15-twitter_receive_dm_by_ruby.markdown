--- 
layout: post
title: "twitter\xE3\x81\xAE\xE3\x83\x80\xE3\x82\xA4\xE3\x83\xAC\xE3\x82\xAF\xE3\x83\x88\xE3\x83\xA1\xE3\x83\x83\xE3\x82\xBB\xE3\x83\xBC\xE3\x82\xB8\xE3\x82\x92\xE5\x8F\x97\xE4\xBF\xA1\xE3\x81\x99\xE3\x82\x8B\xE3\x83\x97\xE3\x83\xAD\xE3\x82\xB0\xE3\x83\xA9\xE3\x83\xA0\xE3\x82\x92ruby\xE3\x81\xA7"
wordpress_id: 407
wordpress_url: http://zzz.jeeet.net/?p=272
date: 2009-01-15 03:13:14 +09:00
---
<strong><span style="color: #ff0000;">この記事は古いので、プログラムが使えない可能性が高いです。
今ならrubygemのtwitterライブラリを使うのがよいと思います。Oauthも必要です。</span>
</strong>

こないだ，<a href="http://tjun.jp/blog/2009/01/ruby_twitter_cron/">twitterにくだらないギャグをpostするプログラム</a>を書いたので，今度は他の人からの投稿を受け付けて，ギャグリストに追加するプログラムを書きました．

[ad]

これで誰でも思いついたくだらないギャグをsubetterに言わせることができます．
<h3><a href="http://twitter.com/subetter">進化したsubetter</a></h3>
ついでに，ギャグをテキストファイルに保存するのはなんかかっこ悪いので，MySQLにも入れることにしました．いずれMySQLに完全に移行したいですが，まだ両方やってます．

まだいくつか問題があって，MySQLにそのままじゃ入れられない文字の処理とか，全然よく分かってないのでその辺から修正しなきゃと思っています．

プログラムはこんな感じ．

[ruby]
require('rubygems')
gem('twitter4r','0.3.0')
require('twitter')
require &amp;quot;mysql&amp;quot;

flag = 0
msg = nil

my = Mysql::new(&amp;quot;localhost&amp;quot;, &amp;quot;user&amp;quot;, &amp;quot;passwd&amp;quot;, &amp;quot;db_name&amp;quot;)

client =Twitter::Client.new(:login =&amp;gt; 'subetter',:password =&amp;gt; 'passwd')

client.messages(:received).each do |msg|
#メッセージのテキストを取得,改行文字を省く
joke = msg.text
joke = joke.strip

#メッセージの送り主を取得
user_name = msg.sender.screen_name

que = &amp;quot;SELECT * FROM jokes WHERE joke='&amp;quot; + joke + &amp;quot;'&amp;quot;
res = my.query(que)
res.each do |row|
flag = 1
end
#p flag

if flag == 0
sql = &amp;quot;INSERT INTO jokes VALUES ('','&amp;quot; + user_name + &amp;quot;','&amp;quot; + joke + &amp;quot;')&amp;quot;
#mysqlにギャグを登録
my.query(sql)
#テキストファイルにもギャグを登録
file = open(&amp;quot;/home/jun/Dropbox/cyg/work/ruby/twitter/jokes.txt&amp;quot;, 'a')
file.puts joke
file.close
else
flag = 0
end
end

exit
[/ruby]
