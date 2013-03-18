---
layout: post
status: publish
published: true
title: ! 'stormのcluster環境のセットアップ& storm UIを試す (後編1: １台で全て動かす)'
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 1115
wordpress_url: http://tjun.jp/blog/?p=1115
date: 2012-04-03 21:01:34.000000000 +09:00
categories:
- storm
tags:
- storm
comments:
- id: 472
  author: stormのcluster環境のセットアップ(centos) | tjun memo
  author_email: ''
  author_url: http://tjun.jp/blog/2012/01/storm-cluster-setup/
  date: '2012-06-05 00:16:03 +0900'
  date_gmt: '2012-06-04 15:16:03 +0900'
  content: ! '[...] stormのcluster環境のセットアップ&amp; storm UIを試す (後編1: １台で全て動かす) [...]'
---
前回からだいぶ時間がたってしまいましたが・・・

前編はこちら
<ul>
	<li><a href="http://tjun.jp/blog/2012/01/storm-cluster-setup/">stormのcluster環境のセットアップ(centos) | tjun memo</a></li>
</ul>

Stormのことを知りたい、あるいは開発環境の設定やローカルモードでの実行を知りたい場合は、下記の記事を参照してください。
<ul>
	<li><a href="http://tjun.jp/blog/2011/10/storm_intro/">twitterが発表したリアルタイム分散処理フレームワークStorm | tjun memo</a></li>
	<li><a href="http://tjun.jp/blog/2011/11/storm_eclipse/">EclipseでStormの開発環境を作る | tjun memo</a></li>
	<li><a href="http://tjun.jp/blog/2011/11/storm_localmode/">Stormをlocalmodeで実行する | tjun memo</a></li>
</ul>


前回はzookeeperやstormのインストールまで終わりました。
今回は、１台の中で、nimbusやsupervisorを動かして、stormを使ってみます。

<h3>Stormのクラスタの設定</h3>

stormの設定は、storm.yaml というファイルを作りますが、
stormのサーバの設定用のstorm.yaml と、クライアントの設定用のstorm.yamlがあるので注意が必要です。
サーバ用とは、stormを動かすための設定で、nimbusとsupervisorで通信したり、zookeeperとやりとりをするための設定です。
クライアント用とは、stormにtopologyを投入する時に、workerはいくつにする、などの設定です。


まず、server設定用を編集します。
server用の設定は、Stormをインストールしたディレクトリを$STORM_HOMEとしたとき、$STORM_HOME/conf にあります。
<pre>
$ vi /usr/local/storm-*.*.*/conf/storm.yaml
</pre>

zookeeperのIP, stormの一時ファイルの置き場、nimbus hostのIP, workerがどのポートを使うか(supervisor.slots.ports)、などを指定する必要があります。
開けるポートの数は、動かすworkerの数以上である必要があります。
とりあえず今回は
zookeeper: 同じマシンで１台
nimbus   : 同じマシン

なので以下のような感じにします。

<pre>
# storm.zookeeper.servers: 
# This is a list of the hosts in the Zookeeper cluster for your Storm cluster.
storm.zookeeper.servers:
- "127.0.0.1"
# - "localhost"
# - "127.0.0.1"

# If the port that your Zookeeper cluster uses is different than the default,
# you should set 'storm.zookeeper.port' as well.
# strom.zookeeper.port: 2181

# storm.local.dir: 
# The Nimbus and Supervisor daemons require a directory on the local disk
# to store small amounts of state (like jars, confs, and things like that).
# You should create that directory on each machine, give it proper permissions, 
# and then fill in the directory location using this config.
storm.local.dir: "/tmp/storm"

# java.library.path: 
# This is the load path for the native libraries that Storm uses (ZeroMQ and JZMQ).
# The default of "/usr/local/lib:/opt/local/lib:/usr/lib" should be fine for
# most installations, so you probably don't need to set this config.
# java.library.path:

# nimbus.host: 
# The worker nodes need to know which machine is the master in order to download
# topology jars and confs.
nimbus.host: "127.0.0.1"

# supervisor.slots.ports:
# For each worker machine, you configure how many workers run on that machine
# with this config. Each worker uses a single port for receiving messages, 
# and this setting defines which ports are open for use. If you define five ports here,
# then Storm will allocate up to five workers to run on this machine. If you define
# three ports, Storm will only run up to three. By default, this setting is configured
# to run 4 workers on the ports 6700, 6701, 6702, and 6703. 
supervisor.slots.ports:
- 6700
- 6701
- 6702
- 6703
</pre>

他にも設定できるパラメータはいくつかあります。
デフォルトでは <a href="https://github.com/nathanmarz/storm/blob/master/conf/defaults.yaml">defaults.yaml</a>の値が使われます。

storm.local.dirを実際に作っておきます。
<pre>
$ mkdir /tmp/storm
</pre>

<h3>stormのクライアントの設定</h3>
stormのクライアント、stormクラスタに対してtopologyをsubmitする役割を持ちます。
そのため、その設定にはnimbusのIP addressが必要です。

stormのクライアントの設定は、
~/.storm/storm.yaml
に記述します。

~/.storm.yaml
<pre>
nimbus.host: "127.0.0.1"
</pre>

以上で設定は終わり。

<h3>storm-starterを動かしてみる</h3>
zookeeper, nimbus, supervisor, uiの順に立ち上げていきます。
uiとは、stormの処理の状態をwebから見えるようにするものです。デフォルトでポート8080を使います。

それぞれ15秒くらい待ってから立ち上げていくのがよいと思います。
<pre>
$ zkServer.sh start
$ storm nimbus &
$ storm supervisor &
$ storm ui &
</pre>


これでちょっと待ってから、ブラウザで接続して状態を見てみます。
以下のように表示されて、supervisor summaryのところに１台あれば、OKです。
<img src="http://tjun.jp/blog/img/2012/04/Storm-UI.jpg" alt="Storm UI" title="Storm UI.jpg" border="0" width="540" height="316" />
（storm uiにはtwitter bootstrapが使われてます。）

これで、無事にsupervisorが動いてることが確認できたので、実際にtopologyをsubmitしてみます。

とりあえず、<a href="http://tjun.jp/blog/2011/11/storm_localmode/">Stormをlocalmodeで実行する</a> で作成したstorm-starter.jarを使います。
storm-starterの中のExclamationTopologyを実行します。

ソースを見てもらえばわかりますが、このtopologyは引数があればクラスタ環境で実行され、その引数がtopologyの名前になります。
ということで、storm jar [jarの名前] [mainクラスの名前] [引数1]のようにすればtopologyをsubmitできます。
<pre>
$ storm jar StormStarter.jar storm.starter.ExclamationTopology test
&hellip;..
[main] INFO  backtype.storm.StormSubmitter  - Jar not uploaded to master yet. Submitting jar...
37   [main] INFO  backtype.storm.StormSubmitter  - Uploading topology jar StormStarter.jar to assigned location: /tmp/storm/nimbus/inbox/stormjar-ea8d5f50-287e-4fcf-a371-81c84f465109.jar
53   [main] INFO  backtype.storm.StormSubmitter  - Successfully uploaded topology jar to assigned location: /tmp/storm/nimbus/inbox/stormjar-ea8d5f50-287e-4fcf-a371-81c84f465109.jar
53   [main] INFO  backtype.storm.StormSubmitter  - Submitting topology test in distributed mode with conf {"topology.workers":3,"topology.debug":true}
348  [main] INFO  backtype.storm.StormSubmitter  - Finished submitting topology: test
</pre>
こんな感じでfinisedまで出れば、submitは成功です。


またブラウザでstorm UIを見てみると、Topology Summaryのところにtestという名前のtopologyが出てきます。
<img src="http://tjun.jp/blog/img/2012/04/Storm-UI-2.jpg" alt="Storm UI 2" title="Storm UI-2.jpg" border="0" width="540" height="324" />


このtest をクリックすると、以下のような感じでtopologyの処理がどのくらい進んでるのか、各spoutやboltに対して見ることができます。
<img src="http://tjun.jp/blog/img/2012/04/Storm-UI3.jpg" alt="Storm UI3" title="Storm UI3.jpg" border="0" width="540" height="414" />


topologyの処理を止めるには、storm kill [topology名]です。
<pre>
$ storm kill test
</pre>

nimbusやsupervisorやzookeeperを止めるには、
<pre>
$ zkServer.sh stop
</pre>
です。storm uiだけは止まらないので、手動でkillします。


ということで、無事にnimbusやsupervisorという仕組みを使ってstormを動かすことができました。
今回は１台でzookeeperからstormまですべて動かしていますが、次はいつか複数台での動かし方について書きます。
supervisorのノードでstorm.yamlにnimbusのIPをちゃんと書けばいいだけですが。。
