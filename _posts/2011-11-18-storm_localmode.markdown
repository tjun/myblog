--- 
layout: post
title: "Storm\xE3\x82\x92localmode\xE3\x81\xA7\xE5\xAE\x9F\xE8\xA1\x8C\xE3\x81\x99\xE3\x82\x8B"
wordpress_id: 1040
wordpress_url: http://tjun.jp/blog/?p=1040
date: 2011-11-18 01:25:00 +09:00
---
stormについては
<ul>
	<li><a href="http://tjun.jp/blog/2011/10/storm_intro/">twitterが発表したリアルタイム分散処理フレームワークStorm | tjun memo</a></li>
</ul>
を参照してください。

今回は
<ul>
	<li><a href="http://tjun.jp/blog/2011/11/storm_eclipse/">EclipseでStormの開発環境を作る | tjun memo</a> </li>
</ul>
の続き。

localmodeで実行ということは、stormのnimbusやsupervisorといった分散のための仕組みを利用せずに、とりあえずstormのプログラムを動かしてみる、というものです。


<h3>storm-starterのダウンロード</h3>

サンプルコードをダウンロードします。
<a href="https://github.com/nathanmarz/storm-starter">nathanmarz/storm-starter - GitHub</a>
<pre>$ git clone git://github.com/nathanmarz/storm-starter.git</pre>

<h3>eclipseに読み込む</h3>
前回作成途中だったJava projectにサンプルのプログラムをimportします。

projectの src に import > general > FileSystem で先ほどダウンロードした storm-starterのしたの <strong>storm-starter/src/jvm/storm</strong> を"From Directory"に指定して、"Create Top-level folder"にチェックを入れます。
<a href="http://tjun.jp/blog/2011/11/storm_localmode/import/" rel="attachment wp-att-1041"><img src="http://tjun.jp/blog/wp-content/uploads/2011/11/Import-300x263.jpg" alt="" title="Import" width="300" height="263" class="aligncenter size-medium wp-image-1041" /></a>
次に、project のトップに storm-starter/multilang/resoucesをimportします。



こんな感じになるはず。

<img src="http://tjun.jp/blog/wp-content/uploads/2012/02/storm-starter.jpg" alt="Storm starter" title="storm-starter.jpg" border="0" width="255" height="466" />


ここでエラーが出ている場合、stormが最新版じゃない可能性があります。


<h3>JARをexport</h3>
そして、このprojectをJARファイルに固めます。

Export > Java > JAR fileから、StormStarterプロジェクトを.classpathや.projectを除いてJARにします。
<a href="http://tjun.jp/blog/2011/11/storm_localmode/jar-export/" rel="attachment wp-att-1045"><img src="http://tjun.jp/blog/wp-content/uploads/2011/11/JAR-Export-246x300.jpg" alt="" title="JAR Export" width="246" height="300" class="aligncenter size-medium wp-image-1045" /></a>

warningが出るけど気にしない。


<h3>実行</h3>
今作成したJARファイルをstormで実行します。
前回の準備で正しくpathが通っていればstormコマンドが利用できるはずです。
（うまく動かない場合はpermissionなどを確認してください）
<pre>
$ storm jar StormStarter.jar storm.starter.ExclamationTopology
</pre>

これで、ダーッと文字が出て、したのようにビックリマークがついた単語が出ていれば成功です。
ExclamationBoltのemitのログが表示されています。
<pre>
....
11367 [Thread-25] INFO  backtype.storm.daemon.task  - Emitting: class storm.starter.ExclamationTopology$ExclamationBolt source: 2:3, stream: 1, id: {}, [golda!!!]
....
</pre>

twitterのstreamを使うTopologyは例えば、
<pre>
$ storm jar StormStarter.jar storm.starter.PrintSampleStream [username] [password]
</pre>
のようなものがあります。

今回使ったstormコマンドは、
<pre>storm jar [jarファイル] [メインクラス] (引数…)</pre>
のようにjarを指定してTopologyの実行を行いました。

他のTopologyも同様に動くと思いますが、wordcountは環境によってはうまく動作しないかもしれません。


以上で、localmodeでstormのプログラムを動かすことが確認できました。


<h3>参考</h3>
<ul>
	<li><a href="https://github.com/nathanmarz/storm/wiki/Creating-a-new-Storm-project">Creating a new Storm project - GitHub</a></li>
</ul>
