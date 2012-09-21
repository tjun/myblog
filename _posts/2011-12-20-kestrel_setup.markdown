--- 
layout: post
title: "Kestrel\xE3\x82\x92centos\xE3\x81\xAB\xE3\x82\xBB\xE3\x83\x83\xE3\x83\x88\xE3\x82\xA2\xE3\x83\x83\xE3\x83\x97"
wordpress_id: 1066
wordpress_url: http://tjun.jp/blog/?p=1066
date: 2011-12-20 00:01:05 +09:00
---
# 2011/12/01時点のものです、最新のものがあるかもしれないので確認してください。

Kestrelは、<a href="http://blog.twitter.com/2009/01/building-on-open-source.html" target="_blank">twitterが使ってるらしい</a>メッセージキューです。

<h2>前準備</h2>

まずgitが必要となるので、gitを使えるようにしてください。

<h2>sbtのインストール</h2>

sbtというのはscalaをビルドするためのツールです。
sbtというコマンドを作成します、ディレクトリなどは適宜読み替えてください。
sbtコマンドが、実行するディレクトリに依存しているので注意してください。
<pre>
# install scala, sbt
wget http://simple-build-tool.googlecode.com/files/sbt-launch-0.7.4.jar
mv sbt-launch-0.7.4.jar ~/bin/
echo 'java -Xmx512M -jar `dirname $0`/sbt-launch-0.7.4.jar "$@"' >> ~/bin/sbt
chmod +x ~/bin/sbt
</pre>

<h2>kestrelのインストール</h2>
次はkestrelをインストールします。
<pre>
# install kestrel
git clone git://github.com/robey/kestrel.git
cd kestrel
sbt clean update package-dist

(時間がかかる)

mkdir /usr/local/kestrel
cp -R ./dist/kestrel-2.*.* /usr/local/kestrel/
ln -s /usr/local/kestrel/kestrel-2.*.* /usr/local/kestrel/current
mkdir /var/run/kestrel
</pre>


<h2>daemonのインストール</h2>
daemonを使ってkestrelの起動の管理ができるようになります。


<pre>
#install daemon

wget http://libslack.org/daemon/download/daemon-0.6.4.tar.gz
cd daemon-0.6.4
./configure
make
make -d install
</pre>

<h2>kestrelの実行</h2>
ここまでが全てうまく行っていれば、
<pre>/usr/local/kestrel/current/script/kestrel.sh</pre>
から実行できます。

kestrel.sh内のHeapサイズが4Gとなっているので、動かない場合はそこを調整してみてください。

直接jarを叩いて実行もできます。
<pre>java -jar /usr/local/kestrel/current/kestrel-2.0.0-SNAPSHOT.jar</pre>

<h2>動作確認</h2>

kestrelを起動したら、telnetで接続して動作を確認します。
<pre>
$ telnet 127.0.0.1 22133
Trying 127.0.0.1... 
Connected to 127.0.0.1.
Escape character is '^]'. 
STATS 
STAT uptime 185 
STAT time 1295254423 
STAT version 1.2.9-SNAPSHOT 
STAT curr_items 0 
</pre>

以上です。


参考にしたページ：
<ul>
	<li><a href="http://martincozzi.blogspot.com/2011/01/how-to-install-kestrel-on-ubuntu-1004.html">Martin Cozzi: How to install Kestrel on Ubuntu 10.04</a></li>
	<li><a href="http://d.hatena.ne.jp/yuroyoro/20090803/1249297348">twitterでも利用されているメッセージキュー Kestrelを試す - ゆろよろ日記</a></li>

</ul>
