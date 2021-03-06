---
layout: post
status: publish
published: true
title: なぜStormを使うか
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 1095
wordpress_url: http://tjun.jp/blog/?p=1095
date: 2012-02-02 00:01:51.000000000 +09:00
categories:
- storm
tags:
- storm
comments: []
---
Stormとは、twitterが公開して開発中のリアルタイム分散処理フレームワークです。
開発も活発で結構よいのでこれからHadoopのように使われるようになるんじゃないかと個人的に思っていて、日本語の情報が全然ないので勝手に日本語で紹介しています。

Stormの概要については前にも書いたけど、今回はその前の、なぜStormを使うのか、どういう処理がターゲットなのか、と言う話について書きます。

Stormの概要について書いた記事：　<a href="http://tjun.jp/blog/2011/10/storm_intro/">twitterが発表したリアルタイム分散処理フレームワークStorm | tjun memo</a>



本記事は、Stormの公式の<a href="https://github.com/nathanmarz/storm/wiki/Rationale">Rationale</a>を元に書いているので、できれば公式を読むことをお勧めします。

<hr />

<h3>なぜStormを使うのか</h3>
最近はMapReduceやHadoop等の技術で、以前には考えられなかったスケールでデータ処理を行うことができるようになりました。しかし、それらの技術はリアルタイム処理のための技術ではありません。リアルタイム処理は、バッチ処理とは根本的に異なる要求があるため、Hadoopをリアルタイム処理に利用することはできません。
しかし、大きなスケールでのリアルタイムデータ処理に対する要求は高まっています。「リアルタイムなHadoop」がないことは、データ処理のエコシステムにおける大きな問題と言えます。

Stormはこの問題を解決します。

Storm以前は、リアルタイム処理のためには例によってキューとワーカーからなるネットワークを作り上げていたでしょう。ワーカーはキューからメッセージを取り出し、データベースを更新して、次の処理のために新たなメッセージを異なるキューへ送ります。残念ながら、この手法には、深刻な制限があります。

<ol>
	<li><strong>1. 退屈な仕事</strong>：開発者は、開発時間のほとんどをメッセージの送信先の設定、ワーカーや中間キューのデプロイに取られ、リアルタイムなデータ処理のロジックへかけられる時間はわずかです。</li>

	<li><strong>2. 脆弱</strong>：　耐故障性に欠けるため、あなたはワーカーとキューが落ちていないか気を配る必要があります。</li>

	<li><strong>3. 拡張が大変</strong>：　１つのワーカーやキューにおけるメッセージのスループットが高まった時、データをどのように分散させるか考える必要があります。メッセージの送り先が変わるため、ワーカーの再設定も必要です。</li>
</ol>

キューとワーカーによるモデルが大量のメッセージの処理を可能にしましたが、メッセージ処理がリアルタイム処理の基本となるパラダイムです。
そこで、問題となるとは、どうやって、データを失うことなく、スケールして膨大なデータに対応するか、またどうやってそれを簡単に使い、操作できるようにするか、ということです。

Stormはこれを実現します。


<h3>Stormの重要性</h3>

Stormはリアルタイム処理のための簡単な枠組みを提供します。MapReduceが並列バッチ処理をとても簡単に書けるようにしたように、Stormの基本機能は並列リアルタイム処理を簡単に書けます。

Stormの特徴は、
<ol>
	<li><strong>1. 幅広いユースケース</strong>：　Stormはメッセージ処理、データベースの更新、連続的なクエリ処理、そしてクライアントに対する処理の結果のストリーミング、検索クエリのようなクエリの並列処理、などいろいろなことができます。Stormの基本機能は、これらの幅広いユースケースを実現します。</li>

	<li><strong>2. スケーラブル</strong>：　Stormは膨大なメッセージに対してもスケールします。Topologyをスケールするには、マシンを追加して、並列数の設定を大きくするだけでいいのです。例えば、１０台のノードで毎秒100万メッセージの処理と、数百回のデータベース呼び出しを行うようなシステムが作れます。ZookeeperがStormのクラスタの調停を行っているため、さらに大きいサイズへスケールさせることもできます。</li>

	<li><strong>3. データの保証</strong>：リアルタイム処理システムは、データが処理されることを必ず保証する必要があります。データの処理漏れがあるシステムはほとんどユースケースがないでしょう。Stormは、すべてのメッセージが処理されることを保証します。この点において、S4のようなシステムと決定的に異なります。	</li>

	<li><strong>4. 堅牢性</strong>：　Hadoopのように扱いにくいシステムと違って、Stormは管理が簡単です。Stormプロジェクトは、ユーザにとって扱いやすいクラスタを実現する、という明確なゴールを持っています。</li>

	<li><strong>5. 耐故障性</strong>：　もし処理中に故障しても、Stormは処理の再割当てを行います。Stormは処理が動き続けることを保証します。（処理のkillをするまで）</li>

	<li><strong>6. 言語非依存</strong>：　ロバストでスケーラブルなリアルタイム処理は、プログラミング言語に縛られるべきではない。StormのTopologyや処理のコンポーネントは、さまざまな言語で定義でき、誰でも利用できます。</li>
</ol>

今回の記事は以上です。
以下のスライドの前半部でも同じようなことが書いてあります。

<div style="width:500px" id="__ss_11164672"> <strong style="display:block;margin:12px 0 4px"><a href="http://www.slideshare.net/nathanmarz/storm-11164672" title="Storm" target="_blank">Storm</a></strong> <iframe src="http://www.slideshare.net/slideshow/embed_code/11164672" width="500" height="418" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe> <div style="padding:5px 0 12px"> View more <a href="http://www.slideshare.net/" target="_blank">presentations</a> from <a href="http://www.slideshare.net/nathanmarz" target="_blank">nathanmarz</a> </div> </div>
