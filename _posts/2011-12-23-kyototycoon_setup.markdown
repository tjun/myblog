--- 
layout: post
title: "kyoto tycoon\xE3\x82\x92centos\xE3\x81\xAB\xE3\x82\xBB\xE3\x83\x83\xE3\x83\x88\xE3\x82\xA2\xE3\x83\x83\xE3\x83\x97"
wordpress_id: 1064
wordpress_url: http://tjun.jp/blog/?p=1064
date: 2011-12-23 21:37:26 +09:00
---
<h2>前準備</h2>
依存するpackageのインストール
gcc44がないと、makeできないから注意です。

<pre>sudo yum install gcc44 gcc44-c++ boost-devel zlib-devel
(libbzip2も必要かも)
</pre>

<h2>kyoto cabinetインストール</h2>
まずはkyoto cabinetを入れます。

<pre>
wget http://fallabs.com/kyotocabinet/pkg/kyotocabinet-1.2.70.tar.gz
tar zxf kyotocabinet-1.2.70.tar.gz 
cd kyotocabinet-1.2.70
./configure CC=gcc44 CXX=g++44
make
sudo make install
</pre>

/etc/ld.so.conf に /usr/local/lib を追加
<pre>
sudo ldconfig
</pre>

<h2>kyoto tycoonのインストール</h2>

<pre>
wget http://fallabs.com/kyototycoon/pkg/kyototycoon-0.9.52.tar.gz
tar zxf kyototycoon-0.9.52.tar.gz 
cd kyototycoon-0.9.52
./configure CC=gcc44 CXX=g++44
make 
sudo make install
sudo ldconfig
</pre>


<h2>kyoto tycoonの起動</h2>

memcachedプロトコルで使いたいので、memcachedプラグインを有効にします

<pre>ktserver -plsv /usr/local/libexec/ktplugservmemc.so -plex 'port=22222'</pre>
永続化するためには、db ファイル名を指定する必要があるようです。
<pre>ktserver -plsv /usr/local/libexec/ktplugservmemc.so -plex 'port=22222' [db filename]</pre>

[db filename]は、拡張子によってKyoto Cabinet内のdb（索引付け）が変わります。

(null): オンメモリ
 ".kch": ハッシュDB
 ".kct": ツリーDB
 ".kcd": ディレクトリハッシュdb
 ".kcf": ディレクトリツリーdb

例
<pre>ktserver -plsv /usr/local/libexec/ktplugservmemc.so -plex 'port=22222' test.kch</pre>

参考:
<ul>
	<li><a href="http://fallabs.com/blog-ja/promenade.cgi?id=98">開発メモ: Kyoto Tycoonベータ版リリースすた</a></li>
	<li><a href="http://www.slideshare.net/estraier/kyoto-tycoon-guide-in-japanese">Kyoto Tycoon Guide in Japanese</a></li>
	<li><a href="http://www.omakase.org/perl/freebsdkyototycoon.html">FreeBSDでKyotoTycoonを使ってみた｜perl｜@OMAKASE</a></li>

</ul>


