--- 
layout: post
title: "debian\xE3\x81\xA7Hadoop(\xE5\xAE\x8C\xE5\x85\xA8\xE5\x88\x86\xE6\x95\xA3)\xE3\x83\xA1\xE3\x83\xA2"
wordpress_id: 678
wordpress_url: http://tjun.jp/blog/?p=678
date: 2010-12-21 02:59:25 +09:00
---
debianでhadoopを動かしてみたときのメモ。
正直まだ全然分かってないので、間違ってるかもしれません。


debian5を5台用意してやりました。

サーバは結構古いやつ。
ソースから入れるかaptを使うか悩んでaptにしたけど、結局ソースをいじる必要があるのでaptはやめました。

master: 192.168.18.10
slave1: 192.168.18.11
slave2: 192.168.18.12
...

とする。


<h2>まずは6台とも共通の準備。</h2>

全部rootで実行してます。
なければsshなどをインストール。
<pre>
# aptitude install openssh-server ssh rsync
</pre>

sources.listを編集。(for jdk)
<pre>
# vi /etc/apt/sources.list

変更
deb http://ftp.jp.debian.org/debian/ lenny main
　→   deb http://ftp.jp.debian.org/debian/ lenny main non-free
</pre>



で，更新。
<pre>
# aptitude update
</pre>


Sun Java6 JDKのインストール。
<pre>
# aptitude install sun-java6-jdk
</pre>

<h2>以下はMasterで作業</h2>
 masterにて，各ノードにパスワードなしでsshログインできるようにする。
<pre>
keyの生成
# ssh-keygen -t dsa -P "" 
masterへ
# cat .ssh/id_dsa.pub >> .ssh/authorized_keys 

各ノードにもmasterのid_dsa.pub を authorized_keysに追加 (省略)
</pre>

次に、Hadoopのパッケージをダウンロードする。

<ul>
	<li><a href="http://www.apache.org/dyn/closer.cgi/hadoop/core/">Apache Download Mirrors</a></li>
</ul>
から、適当なmirrorを選んで、stableなやつをダウンロード。

<pre>
（今回は0.20.2をダウンロードした。）
# wget http://ftp.riken.jp/net/apache//hadoop/core/stable/hadoop-0.20.2.tar.gz

/usr/local/下に置いて、解凍して、/usr/local/hadoop にリンクを作る
# cp hadoop-0.20.2.tar.gz /usr/local/
# cd /usr/local/
# tar zxf hadoop-0.20.2.tar.gz
# ln -s hadoop-0.20.2 hadoop
# cd hadoop
</pre>

<h2>Hadoopの設定</h2>
次は設定。
各種設定ファイルを編集。


まずは <strong>conf/masters</strong> を編集。
masterのIPアドレスを書く。
<pre>
192.168.18.1
</pre>

<strong>conf/slaves</strong>
slaveのIPを1行に1つ書く。
<pre>
192.168.18.2
192.168.18.3
....
</pre>

<strong>core-site.xml</strong>
masterのIPを入れる。
[xml]
&lt;?xml version=&quot;1.0&quot;?&gt;
&lt;?xml-stylesheet type=&quot;text/xsl&quot; href=&quot;configuration.xsl&quot;?&gt;

&lt;!-- Put site-specific property overrides in this file. --&gt;

&lt;configuration&gt;
  &lt;property&gt;
    &lt;name&gt;fs.default.name&lt;/name&gt;
    &lt;value&gt;hdfs://[master IP]:9000&lt;/value&gt;  
  &lt;/property&gt;

  &lt;property&gt;
     &lt;name&gt;hadoop.tmp.dir&lt;/name&gt;
     &lt;value&gt;/var/lib/hadoop/cache/${user.name}&lt;/value&gt;
  &lt;/property&gt;

&lt;/configuration&gt;
[/xml]

<strong>hdfs-site.xml</strong>
[xml]
&lt;?xml version=&quot;1.0&quot;?&gt;
&lt;?xml-stylesheet type=&quot;text/xsl&quot; href=&quot;configuration.xsl&quot;?&gt;

&lt;!-- Put site-specific property overrides in this file. --&gt;

&lt;configuration&gt;

  &lt;property&gt;
     &lt;!-- specify this so that running 'hadoop namenode -format' formats the right dir --&gt;
     &lt;name&gt;dfs.name.dir&lt;/name&gt;
     &lt;value&gt;${hadoop.tmp.dir}/dfs/name&lt;/value&gt;
  &lt;/property&gt;

  &lt;property&gt;
    &lt;name&gt;dfs.data.dir&lt;/name&gt;
    &lt;value&gt;${hadoop.tmp.dir}/dfs/data&lt;/value&gt;
  &lt;/property&gt;

  &lt;property&gt;
    &lt;name&gt;dfs.replication&lt;/name&gt;
    &lt;value&gt;4&lt;/value&gt;
  &lt;/property&gt;

&lt;/configuration&gt;
[/xml]


<strong>mapred-site.xml</strong>
[xml]
&lt;?xml version=&quot;1.0&quot;?&gt;
&lt;?xml-stylesheet type=&quot;text/xsl&quot; href=&quot;configuration.xsl&quot;?&gt;

&lt;!-- Put site-specific property overrides in this file. --&gt;

&lt;configuration&gt;
  &lt;property&gt;
    &lt;name&gt;mapred.job.tracker&lt;/name&gt;
    &lt;value&gt;[master IP]:9001&lt;/value&gt;
  &lt;/property&gt;

&lt;/configuration&gt;
[/xml]


<strong>conf/hadoop-env.sh</strong>
でJAVA_HOMEを設定。
<pre>
export JAVA_HOME=/usr/lib/jvm/java-6-sun
</pre>


これでたぶん設定ができたので、slaveにパッケージをコピーして配置する。
<pre>
# cd /usr/local/
# tar zcf myhadoop.tar.gz hadoop-0.20.2

省略(各スレーブにmyhadoop.tar.gzを送って、/usr/local/下に展開、
　　　/usr/local/hadoopにリンクを作る)
</pre>

<h2>hadoopを動かす</h2>
※以下は自分ではやってないので、本当にあってるのか分かりません。


masterにて新規ファイルシステムをフォーマット。
<pre>
# cd /usr/local/hadoop
# bin/hadoop namenode -format
</pre>

Hadoop DFSの起動
<pre>
# bin/start-dfs.sh</pre>

MapReduceの起動
<pre>
# bin/start-mapred.sh
</pre>

動いてるプロセスの確認
<pre>
# jps
</pre>

Hadoopデーモンの停止
<pre>
# bin/stop-mapred.sh
# bin/stop-dfs.sh
</pre>



<h3>参考にしたサイト</h3>
<ul>
	<li><a href="http://metasearch.sourceforge.jp/wiki/index.php?Hadoop%A5%BB%A5%C3%A5%C8%A5%A2%A5%C3%A5%D7">Hadoopセットアップ - Meta Search</a></li>

	<li><a href="http://d.hatena.ne.jp/kaorumori/20101018/1287506192">Debian 5.0 (lenny)にHadoopを完全分散モードでインストール - 森薫の日記</a></li>

	<li><a href="http://saburi380.blogspot.com/2009/11/1hadoop30ubuntucloudera.html">きりんさん日記: 1台構成のHadoopを30分で試してみる(Ubuntu + Cloudera)</a></li>
</ul>
