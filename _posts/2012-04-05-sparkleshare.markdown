--- 
layout: post
title: "SparkleShare\xE3\x81\xA7\xE3\x81\x95\xE3\x81\x8F\xE3\x82\x89VPS\xE3\x81\xAB\xE3\x82\xAA\xE3\x83\xAC\xE3\x82\xAA\xE3\x83\xACDropbox\xE3\x82\x92\xE4\xBD\x9C\xE3\x82\x8B"
wordpress_id: 1124
wordpress_url: http://tjun.jp/blog/?p=1124
date: 2012-04-05 00:43:29 +09:00
---
さくらVPSを同じお値段で移行して、サーバの容量にかなり余裕ができたので、それを使って自分専用Dropbox的なことをやってみようと思いました。


使うのは、<a href="http://sparkleshare.org/">SparkleShare</a> というオープンソースのソフト。

インストールは基本的には、上記サイトにあるようにやっていけば大丈夫です。

<h3>クライアントのインストール</h3>

まずは、クライアントを入れます。
<a href="https://github.com/hbons/SparkleShare/downloads">Downloads · hbons/SparkleShare</a>からダウンロードできます。
自分は、mac版を入れて、Applicationsに入れました。他にもLinux版とWindows版のクライアントもあります。

それを起動すると、以下のような画面でユーザ名とメールアドレスを入力します。
<img src="http://tjun.jp/blog/wp-content/uploads/2012/04/SparkleShare.jpg" alt="SparkleShare1" title="SparkleShare.jpg" border="0" width="540" height="364" />

で、最後まで進めます。

すると、SparkleShare というディレクトリがホームフォルダにできています。
その中に、keyが書かれたファイルが作られています。

<img src="http://tjun.jp/blog/wp-content/uploads/2012/04/SparkleShare-key.jpg" alt="SparkleShare key" title="SparkleShare-key.jpg" border="0" width="399" height="234" />

このファイルに書かれたkeyを後で使います。


<h3>サーバ側の設定</h3>
サーバ側では、gitというユーザを作って、そのユーザでSparkleShareを利用することにします。

以下のコマンドで、ユーザと、gitのプロジェクトと、.ssh以下のキーファイルを書くためのファイルの作成を行います。
MyProject は他の名前でも大丈夫です。
<pre>
sudo adduser ––disabled-password git
sudo git init ––bare /home/git/MyProject
sudo mkdir /home/git/.ssh
sudo touch /home/git/.ssh/authorized_keys
</pre>


ここで作られたauthorized_keysのファイルに、先程クライアント側でできたkeyのファイルに書かれた文字列をコピーします。

その後に、以下のコマンドを実行します。
<pre>
sudo chmod 700 /home/git/.ssh
sudo chmod 600 /home/git/.ssh/authorized_keys
sudo chown -R git:git /home/git
</pre>

以上で、サーバ側の設定は終わりです。


<h3>クライアントにサーバの設定を追加する</h3>
サーバの設定が終わったら、そのサーバの情報をクライアントに追加します。
まず、メニューバーにあるSparkleshareのアイコンをクリックして、 "Add Hosted Project" を選択します。

<img src="http://tjun.jp/blog/wp-content/uploads/2012/04/Skitch.jpg" alt="sparkleIcon" title="Skitch.jpg" border="0" width="144" height="46" />

で、そこに今のサーバのアドレスと、先程サーバ側で作ったプロジェクトへのpathを入力します。
sshでデフォルトの22以外を使う場合は、以下のようにアドレスに続いてportを指定します。
<img src="http://tjun.jp/blog/wp-content/uploads/2012/04/SparkleShare3.jpg" alt="SparkleShare3" title="SparkleShare3.jpg" border="0" width="464" height="77" />

これで、今までの設定があっていれば、うまく設定が完了します。

あとは、ファイルを~/SparkleShare/MyProjectに追加すれば、自動的にアップされます。


他のマシンで共有する場合は、新しいマシンにクライアントを入れて、そのクライアントのkeyをサーバのauthorized_keysに追記して、クライアント側でサーバの設定を入力すれば、OKです。


S3をバックエンドに持つDropboxのようなデータの冗長性はないですけど、サーバのディスクが余ってる人なら、Dropboxのような感覚で無料で使えるので試してみてもよいと思います。
また、外部のサービスにはデータ置けないっていう会社の人も、LAN内のサーバで運用するなどすれば使えるかもしれません。


<h3>関連しそうなサイト：</h3>
<ul>
	<li><a href="http://gihyo.jp/admin/serial/01/ubuntu-recipe/0210">Ubuntu Weekly Recipe：第210回　SparkleShareで自分専用のDropboxサービスを立ち上げる｜gihyo.jp … 技術評論社</a></li>
	<li><a href="http://www.nofuture.tv/linux/sparkleshare">SparkleShareメモ - nofuture.tv</a></li>
</ul>

