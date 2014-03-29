---
layout: post
status: publish
published: true
title: EclipseでStormの開発環境を作る
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 1021
wordpress_url: http://tjun.jp/blog/?p=1021
date: 2011-11-17 22:48:44.000000000 +09:00
categories:
- cloud
- storm
tags:
- storm
comments:
- id: 349
  author: Stormをlocalmodeで実行する | tjun memo
  author_email: ''
  author_url: http://tjun.jp/blog/2011/11/storm_localmode/
  date: '2011-11-18 01:37:50 +0900'
  date_gmt: '2011-11-17 16:37:50 +0900'
  content: ! '[...] EclipseでStormの開発環境を作る | tjun memo   の続き。  [...]'
- id: 362
  author: stormのcluster環境のセットアップ(centos) | tjun memo
  author_email: ''
  author_url: http://tjun.jp/blog/2012/01/storm-cluster-setup/
  date: '2012-01-11 00:16:20 +0900'
  date_gmt: '2012-01-10 15:16:20 +0900'
  content: ! '[...] EclipseでStormの開発環境を作る | tjun memo [...]'
---
Stormはtwitterが公開しているリアルタイム分散処理フレームワークです。
以前のエントリを参照ください。

<a href="http://tjun.jp/blog/2011/10/storm_intro/">twitterが発表したリアルタイム分散処理フレームワークStorm | tjun memo</a>


今回は、その開発環境を作るメモ。

<h3>0. 準備</h3>
EclipseとJavaは入れて、Javaのpathは通してください。
<pre>
$ echo $JAVA_HOME
/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
</pre>


<h3>1. stormのダウンロード</h3>

<a href="https://github.com/nathanmarz/storm/downloads">https://github.com/nathanmarz/storm/downloads</a> から最新のstormをダウンロードして、zipを解凍してください。（2011/2/3の安定verは0.6.2）

そして、storm/binにpathを通します。

<pre>
$ wget https://github.com/downloads/nathanmarz/storm/storm-0.6.2.zip --no-check-certificate
$ unzip storm-0.6.2.zip
$ sudo cp -R storm-0.6.2 /usr/local/
$ sudo ln -s /usr/local/storm-0.6.2 /usr/local/storm
$ export STORM_HOME=/usr/local/storm
$ export PATH=$PATH:$STORM_HOME/bin
</pre>


<h3>2. twitter4jのダウンロード</h3>

Storm-starterのtwitter関連のサンプルを実行する場合は、Twitter4j(2.2.5+)をダウンロードします。他のサンプルもあるので、とりあえず飛ばしても大丈夫です。
<a href="http://twitter4j.org/en/index.html">http://twitter4j.org/en/index.html</a>
これも解凍してください。

twitter4j/lib以下のJARファイルをstormから利用するため、JARをstormのlibディレクトリに置きます。
<pre>
$ sudo cp twitter4j/lib/*.jar /usr/local/storm-0.5.4/lib/
</pre>


<h3>3. Eclipseでプロジェクトの作成</h3>

stormのプログラムのために、設定を行います。

<ul>
	<li>3-1. 
新規のJava projectを作成</li>

	<li>3-2. 
Project Libraryの"Add External JARsに、先程ダウンロードしたstorm以下にあるJARを入れます。
必要なのは <strong>storm/storm-*.*.*.jar</strong> と <strong>storm/lib/以下の全てのJAR</strong> になります。</li>

	<li>3-3. 
twitter関連のサンプルを実行する場合、同じくJARをlibraryに追加します。
先ほどダウンロードして解凍した twitter4j/lib/以下の <strong>twitter4j-core-2.2.5.jar</strong> と <strong>twitter4j-stream-2.2.5.jar</strong> を追加。
</li>
</ul>

<a href="http://tjun.jp/blog/img/2011/11/NewJavaProject-258x300.jpg" rel="attachment"><img src="http://tjun.jp/blog/img/2011/11/NewJavaProject-258x300.jpg" alt="" title="ProjectLibrary" width="434" height="504" class="aligncenter size-medium" /></a>

準備は以上です。

次回はstormのサンプルを実行する部分を説明します。
<ul>
	<li><a href="http://tjun.jp/blog/2011/11/storm_localmode/">Stormをlocalmodeで実行する | tjun memo</a></li>
</ul>

<h3>参考</h3>
<ul>
	<li><a href="http://groups.google.com/group/storm-user/browse_thread/thread/5d46225969470773/4cd6b297022e3279?lnk=gst&q=eclipse#4cd6b297022e3279">Easy Steps to Create Storm Project (w/ Twitter Support) in Eclipse - storm-user | Google Groups</a></li>
</ul>
