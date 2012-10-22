---
layout: post
status: publish
published: true
title: twitterが発表したリアルタイム分散処理フレームワークStorm
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 967
wordpress_url: http://tjun.jp/blog/?p=967
date: 2011-10-02 23:20:58.000000000 +09:00
categories:
- cloud
- storm
tags:
- storm
comments:
- id: 348
  author: Stormをlocalmodeで実行する | tjun memo
  author_email: ''
  author_url: http://tjun.jp/blog/2011/11/storm_localmode/
  date: '2011-11-18 01:25:04 +0900'
  date_gmt: '2011-11-17 16:25:04 +0900'
  content: ! '[...] twitterが発表したリアルタイム分散処理フレームワークStorm | tjun memo  を参照してください。  今回は  [...]'
- id: 354
  author: EclipseでStormの開発環境を作る | tjun memo
  author_email: ''
  author_url: http://tjun.jp/blog/2011/11/storm_eclipse/
  date: '2011-12-27 00:27:07 +0900'
  date_gmt: '2011-12-26 15:27:07 +0900'
  content: ! '[...] 。  twitterが発表したリアルタイム分散処理フレームワークStorm | tjun memo   今回は、その開発環境を作るメモ。  [...]'
- id: 361
  author: stormのcluster環境のセットアップ(centos) | tjun memo
  author_email: ''
  author_url: http://tjun.jp/blog/2012/01/storm-cluster-setup/
  date: '2012-01-09 13:55:49 +0900'
  date_gmt: '2012-01-09 04:55:49 +0900'
  content: ! '[...] twitterが発表したリアルタイム分散処理フレームワークStorm | tjun memo [...]'
- id: 372
  author: なぜStormを使うのか | tjun memo
  author_email: ''
  author_url: http://tjun.jp/blog/2012/02/storm_rationale/
  date: '2012-02-02 00:01:56 +0900'
  date_gmt: '2012-02-01 15:01:56 +0900'
  content: ! '[...] twitterが発表したリアルタイム分散処理フレームワークStorm [...]'
- id: 414
  author: ! 'stormのcluster環境のセットアップ&amp; storm UIを試す (後編1: １台で全て動かす) | tjun memo'
  author_email: ''
  author_url: http://tjun.jp/blog/2012/04/storm-cluster-setup2-one/
  date: '2012-04-04 00:11:41 +0900'
  date_gmt: '2012-04-03 15:11:41 +0900'
  content: ! '[...] twitterが発表したリアルタイム分散処理フレームワークStorm | tjun memo [...]'
---
<a href="http://www.flickr.com/photos/65765645@N00/6203090442/" title="" target="_blank"><img src="http://farm7.static.flickr.com/6161/6203090442_56094700ae_m.jpg" alt="" border="0" /></a><br /><small><a href="http://creativecommons.org/licenses/by/2.0/" title="Attribution License" target="_blank"><img src="http://tjun.jp/blog/wp-content/plugins/photo-dropper/images/cc.png" alt="Creative Commons License" border="0" width="16" height="16" align="absmiddle" /></a> <a href="http://www.photodropper.com/photos/" target="_blank">photo</a> credit: <a href="http://www.flickr.com/photos/65765645@N00/6203090442/" title="CoreBurn" target="_blank">CoreBurn</a></small>

twitterが先日stormというリアルタイムな分散処理フレームワークstormを公開しました。
（ここでいうリアルタイムとは、すぐに、とか連続的に、というニュアンスで使っています）
Stormは、連続的に来るデータに対して同じ処理を繰り返しかけて新たなストリームを作る、という目的のフレームワークです。
分散やメッセージの保証をフレームワークに任せて、SpoutとBoltという処理を書くだけでシステムを作ることができます。
updateも頻繁に行われていて、user-groupも活発なので、これから利用者が増えていくかもしれません。

分散処理フレームワークというとHadoopが有名ですが、Hadoopではまとまったデータを一気に処理するバッチ処理を、簡単に分散でき高速に処理することができるフレームワークでした。
一方Stormでは、連続的に到達するデータに対して、連続的に結果を出すような処理を、簡単に分散させて処理することができるフレームワークになります。
YahooのS4などが近いです。

もともとはtwitterが買収したbacktypeの技術になります。
twitterでは、例えば連続的発生するtweetをstream APIから読み込んで、現在のtrend topicを出す、というような処理に使われているようです。
2011/09/19に行われたstrange loopというイベントで発表して、オープンソースとして公開されました。
2011/09/19の公開時には ver.0.5.4でしたが、現在はver.0.6.2までアップデートされています。（2012/1/31現在）

関連する日本語の記事：
<ul>
	<li><a href="http://gihyo.jp/dev/clip/01/orangenews/vol65/0001">濃縮還元オレンジニュース：Twitter，分散リアルタイム処理システム「Storm」公開｜gihyo.jp &hellip; 技術評論社</a></li>
	<li><a href="http://www.infoq.com/jp/news/2011/09/twitter-storm-real-time-hadoop">InfoQ: ツイッターStorm:オープンソースのリアルタイムHadoop</a></li>
</ul>


<h3>開発者向けの情報</h3>
<ul>
  公開されたソースコード
  <li><a href="https://github.com/nathanmarz/storm">nathanmarz/storm - GitHub</a></li> 

  githubのwikiにいろいろなチュートリアル的な説明があります。ここを読めばだいたい分かります。
  <li><a href="https://github.com/nathanmarz/storm/wiki"> nathanmarz/storm/wiki </a></li>

  google groupでは、開発者が多くの質問に答えていてます。
  <li><a href="http://groups.google.com/group/storm-user">storm-user | Google Groups</a></li>
</ul>


<h3>関連しそうなスライド</h3>
Stormの概要をつかむには以下のスライドが分かりやすいと思います。（英語です）
<ul>
  <li><a href="http://www.slideshare.net/nathanmarz/storm-11164672">Storm</a></li>
  <li><a href="http://www.slideshare.net/nathanmarz/the-secrets-of-building-realtime-big-data-systems">The Secrets of Building Realtime Big Data Systems</a></li>
</ul>

<strong>※2012/3/25 追記
</strong>ちょっと前に日本でもstormに関する勉強会があったので、そこで使われたスライドも紹介します。
<ul>
  <li><a href="http://www.slideshare.net/AdvancedTechNight/twitterstorm">Twitterのリアルタイム分散処理システム「Storm」入門</a></li>
</ul>

 
<h2>Stormとはどのようなものか</h2>
stormでの処理はどのようなものか、どのように書けるのか、先程のwikiや以下のサイトに記述があるので、そこから簡単に紹介します。
<a href="http://engineering.twitter.com/2011/08/storm-is-coming-more-details-and-plans.html">Twitter Engineering: A Storm is coming: more details and plans for release</a>

自分の理解は間違っている可能性があるので、上のサイトやスライドなどを読むことをおすすめします。
また、間違いがあれば教えていただけると幸いです。


<h3>Stormでは何ができるか？</h3>

<a href="http://tjun.jp/blog/2011/10/storm_intro/storm-proccessing/" rel="attachment wp-att-1114"><img src="http://tjun.jp/blog/img/2011/10/storm-proccessing-512x204.png" alt="" title="storm-proccessing" width="512" height="204" class="aligncenter size-large wp-image-1114" /></a>
<ul>
<li><strong>１，stream processing</strong></li>
データストリームを処理して、データベースを更新するような処理。
キューとワーカーでやっていた処理を、耐故障性を持ちながらスケーラブルに行うことができます。

<li><strong>２，Continuout computation</strong></li>
continuousなクエリを行い、その結果をリアルタイムにクライアントにstreamすることができます。
例えば、twitterののストリームからトレンドトピックのストリームを生成し続けるようなものです。

<li><strong>３, Distributed RPC</strong></li>
動作中のStormに対して、任意のクエリ投げて並行して処理させることも可能です。
Stormはクエリメッセージを待ち受け、クライアントにその結果を返します。

</ul>
 
<h3>stormの処理</h3>
Stormの構成はHadoopに似ています。HadoopにおけるMapreduce jobに対応するのが、Stormでは Topology になります。TopologiesはMapReduce job と大きく異なるが、一番の違いは、topologiesには終わりがないということ（ユーザが止めるまで動き続ける）。

Stormのノードにはmasterノードとworkerノードがあり、masterノードは Nimbus　と呼ばれます（hadoopにおけるjob tracker）。
<a href="http://tjun.jp/blog/2011/10/storm_intro/storm-cluster/" rel="attachment wp-att-972"><img src="http://tjun.jp/blog/img/2011/10/storm-cluster-300x243.png" alt="" title="storm-cluster" width="400" height="324" class="aligncenter size-medium wp-image-972" /></a>
Nimbusはworkerへタスクを割り振り、workerのモニタリングを行います。
それぞれのworkerノードでは、Supervisorというデーモンを動いています。SupervisorはNimbusからworkがアサインされるのを待ち受け、workerプロセスのスタート、ストップを行います。それぞれのworkerプロセスはTopologyのサブセットを実行する。

NimbusとSupervisor間の調停にはzookeeper を利用します。
NimbusとSupervisorのデーモンはステートレスで、ステートはzookeeperやローカルディスクに保持されます。
そのため、workerプロセスをkill -9　しても自動的に立ち上がり動作することができます。これにより、stormクラスタはstableとなっています。


<h3>Stream と Topologies</h3>
Streamとは途切れずに連続するタプルのことで、例えば連続的なtweetのようなものです。
Stormはstreamを、新たなストリームへ、分散して信頼できる方法で変換します。例えばtweetのstreamを、トレンドトピックのストリームへ変換します。

streamの変換のために、stormはSpoutとBoltという２つの機能を提供します。
<a href="http://tjun.jp/blog/2011/10/storm_intro/topology/" rel="attachment wp-att-973"><img src="http://tjun.jp/blog/img/2011/10/topology-300x231.png" alt="" title="topology" width="300" height="231" class="aligncenter size-medium wp-image-973" /></a>
spoutはストリームの源であり、spoutからStormの処理が開始されます。
spoutの役割は、例えばキューからタプルを読み込んでstreamを生成したり、twitterAPI からtweetのstreamを作成したりする処理になります。

Boltは1回のstream変換処理になります。
複雑な変換（tweetsのstreamからtrend topicのstreamを作成する処理のように） の場合、複数のBoltでその処理を実現することになります。
Spoutと、Boltで構成される複数段階のstream変換は、Topologyというpackageにまとめられる。そのtopologyをstormのクラスタに渡すことで処理されます。

Topologyはstreamの変化のグラフであり、それぞれのノードがspoutかboltとなっている。図の矢印は、どのBoltがどのstreamを使うか(subscribe)を示してます。
stormではこれらの処理が分散して平行に行われます。
tupleは、中間的な状態にはならず、tupleを生成したthreadから、そのtupleを利用するthreadへ直接送られます。

次は、wordcountの例を用いて説明します。

<h3>Wordcountの例</h3>
<a href="http://tjun.jp/blog/2011/10/storm_intro/word-count-pic/" rel="attachment wp-att-974"><img src="http://tjun.jp/blog/img/2011/10/word-count-pic.png" alt="" title="word-count-pic" width="486" height="63" class="aligncenter size-full wp-image-974" /></a>

Wordcountを行うtopologyに対する入力は、複数の単語からなる文章です。stormは、その文章に含まれる単語をそれぞれカウントして、出力します。
上の図でいうと、KestrelSpoutが、Kestrelというキューから、データを取得して、文章を次のboltへ出力します。
次に、SplitSentenceBoltが、入力された文章を個々の単語に分け、単語１つを１つのtupleとして出力します。
最後にWordCountBoltが、入力された単語の数を数えていき、その単語とその数を出力します。

このような処理を行うtopologyは、以下のように書くことができます。


<strong>Topologyの定義</strong>
{% highlight java linenos %}
TopologyBuilder builder = new TopologyBuilder();
builder.setSpout("MySpout", new KestrelSpout("kestrel.backtype.com",
                                      22133,
                                      "sentence_queue",
                                      new StringScheme()));

builder.setBolt("SplitBolt", new SplitSentence(), 10)
  .shuffleGrouping("MySpout");

builder.setBolt("WordCountBolt", new WordCount(), 20)
  .fieldsGrouping("SplitBolt", new Fields("word"));
{% endhighlight %}

spoutはtopologyにsetSpoutメソッドからユニークなID（上の例では"MySpout"）を割り当てられて追加されます。
topologyの全てのノード（spoutやbolt）は必ずIDが割り当てられ、そのIDを用いてboltからoutput streamがsubscribeされます。
boltの追加はsetBoltを用います。
 

Topologyにおける個々のboltは以下のように書けます。
<strong>Boltの例</strong>（SplitSentencceBolt）
文章を単語に分割するboltです。

{% highlight java linenos %}
public class SplitSentence implements IBasicBolt {
  
  public void prepare(Map conf, TopologyContext context) {
  }

  public void execute(Tuple tuple, BasicOutputCollector collector) {
    String sentence = tuple.getString(0);
    for(String word: sentence.split(" ")) {
      collector.emit(new Values(word));
    }
  }

  public void cleanup() {
  }

  public void declareOutputFields(OutputFieldsDeclarer declarer) {
    declarer.declare(new Fields("word"));
  }
}
{% endhighlight %}
これは、文章を入力として、それぞれの単語をtupleとして出力していくBoltの例になります。
executeメソッドで、タプルを受け取って、タプルを生成する処理を行なっています。


また、boltは他の言語でも書くこともできます。
pythonの例
{% highlight python linenos %}
import storm

class SplitSentenceBolt(storm.BasicBolt):
    def process(self, tup):
        words = tup.values[0].split(" ")
        for word in words:
          storm.emit([word])
{% endhighlight %}


ToplogyにおけるsetBoltメソッドのの最後の引数は、boltの処理をどれだけ並列するかを示します。
上の例に出てきたsplitsentenceでは並列数が10なので、クラスタ内で10のthreadで平行して処理されます。
topologyをスケールしたい場合、 ボトルネックとなる処理の、この値を大きくすればよい。

setBoltメソッドは、宣言したinputのオブジェクトを返します。
上記の例のSplitSentence boltは、id"MySpout"のoutput streamを、shuffle groupingを用いてsubscribeしています。
この場合、id="MySpout"とは、KestrelSpoutであるので、kestrelSpoutを参照します。
ポイントは、KestrelSpoutから出力される全てのtupleを、splitsentenctBoltが消費する、ということです。

boltは複数のinput streamをsubscribeできるので、下のようにすれば複数のstreamを合わせるような処理ができます。
{% highlight java linenos %}
builder.setBolt(4, new MyBolt(), 12)
    .shuffleGrouping(1)
    .shuffleGrouping(2)
    .fieldsGrouping(3, new Fields("id1", "id2"));
{% endhighlight %}


この後にもWordCountの説明や複数のstream処理などの説明もありますが省略します。

<h3>Stormがやってくれること</h3>
<ul>
  <li>メッセージの処理の保証</li>
  <li>ロバストな処理の管理</li>
  <li>故障検知と再割当て</li>
  <li>効率的なmessage passing</li>
  <li>Local ModeとDistributed Modeを提供</li>
</ul>
メッセージ処理をどのように保証するか、は以下のページに詳しく書いてあります。
<ul>
	<li><a href="https://github.com/nathanmarz/storm/wiki/Guaranteeing-message-processing">Guaranteeing message processing - GitHub</a></li>
</ul>

故障検知については以下のページに書いてあります。
<ul>
	<li><a href="https://github.com/nathanmarz/storm/wiki/Fault-tolerance">Fault tolerance - GitHub</a></li>
</ul>



<h3>Stormに似たその他の技術</h3>
StormはCEP("Complex Event Processing&rdquo; systems)です。
そのようなシステムは、他にもEsperやS4(yahooが作ったやつ)があります。
S4と似ているが、S4より優れているところとして、Stormでは故障があってもメッセージの処理が保証されるとのこと。

<h3>まとめ</h3>
Stormは、連続的に来るデータに対して同じ処理を繰り返しかけて新たなストリームを作る、という目的のフレームワークです。
分散などをフレームワークに任せて、SpoutとBoltという処理を書くだけでシステムを作ることができます。
updateも頻繁に行われていて、これから利用者が増えていくかもしれません。

ここに書いていないことも、上で紹介したサイトに行けばいろいろ書いてあります。
AWS向けのパッケージなどもあります。
興味がある人は是非読んでみてください。
