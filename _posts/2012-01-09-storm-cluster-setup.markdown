---
layout: post
status: publish
published: true
title: stormのcluster環境のセットアップ(前編)
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 1072
wordpress_url: http://tjun.jp/blog/?p=1072
date: 2012-01-09 13:55:44.000000000 +09:00
categories:
- centos
- storm
tags:
- storm
comments:
- id: 412
  author: ! 'stormのcluster環境のセットアップ&amp; storm UIを試す (後編1: １台で全て動かす) | tjun memo'
  author_email: ''
  author_url: http://tjun.jp/blog/2012/04/storm-cluster-setup2-one/
  date: '2012-04-03 21:01:42 +0900'
  date_gmt: '2012-04-03 12:01:42 +0900'
  content: ! '[...] stormのcluster環境のセットアップ(centos) | tjun memo   Stormと、その開発環境の設定やローカルモードでの実行は下記の記事を参照してください。   [...]'
- id: 477
  author: rubyでstormが書ける、Redstormを試す | tjun memo
  author_email: ''
  author_url: http://tjun.jp/blog/2012/06/redstorm/
  date: '2012-06-17 21:34:05 +0900'
  date_gmt: '2012-06-17 12:34:05 +0900'
  content: ! '[...] 環境で動かす場合の、stormのセットアップは以下を参照してください。 stormのcluster環境のセットアップ(centos)
    | tjun memo stormのcluster環境のセットアップ&amp; storm UIを試す (後編1: １台で全て [...]'
---
Stormと、その開発環境の設定やローカルモードでの実行は下記の記事を参照してください。

<ul>
	<li><a href="http://tjun.jp/blog/2011/10/storm_intro/">twitterが発表したリアルタイム分散処理フレームワークStorm | tjun memo</a></li>
	<li><a href="http://tjun.jp/blog/2011/11/storm_eclipse/">EclipseでStormの開発環境を作る | tjun memo</a></li>
	<li><a href="http://tjun.jp/blog/2011/11/storm_localmode/">Stormをlocalmodeで実行する | tjun memo</a></li>
</ul>

今回は、stormのnimbusやsupervisorを利用する、クラスタ環境をセットアップするときのメモです。
centosで試していますが、linux環境であれば同じような感じで動くと思います。
マシンは複数台を想定していますが、１台の中で動かすこともできます。

<h2>関連モジュールのインストール</h2>
stormを動かすのに必要なものをインストールします。
基本的には、ここに書かれている手順に従います。
<ul>
	<li><a href="https://github.com/nathanmarz/storm/wiki/Setting-up-a-Storm-cluster">Setting up a Storm cluster - GitHub</a></li>
</ul>
バージョンが、最新版じゃないものを入れるものも多いので、注意して下さい。
また、今後変わることもありますので、上記の公式ページを確認するのがいいと思います。

<h3>Java</h3>
Javaが必要です。環境変数JAVA_HOMEも設定してください。

<h3>zookeeper のセットアップ</h3>

Apache zookeeper からリリースのアーカイブを取得(今回は 3.3.3 を使いました)
<ul>
	<li><a href="http://zookeeper.apache.org/releases.html">Apache ZooKeeper - Releases</a></li>
</ul>

<pre>
wget http://ftp.meisei-u.ac.jp/mirror/apache/dist//zookeeper/zookeeper-3.3.3/zookeeper-3.3.3.tar.gz
tar zxf zookeeper-3.3.3.tar.gz
sudo cp -R zookeeper-3.3.3 /usr/local/
sudo ln -s /usr/local/zookeeper-3.3.3/ /usr/local/zookeeper
</pre>


インストールしたディレクトリを ZOOKEEPER_HOME に設定し、$ZOOKEEPER_HOME/bin の実行パスに設定。
<pre>
export ZOOKEEPER_HOME="/usr/local/zookeeper" 
export PATH=$PATH:$ZOOKEEPER_HOME/bin
</pre>
    
$ZOOKEEPER_HOME/conf/zoo.cfg を作成する
zoo_sample.cfg をベースに修正。
<pre>sudo cp /usr/local/zookeeper/conf/zoo_sample.cfg /usr/local/zookeeper/conf/zoo.cfg </pre>
dataLogDir を追加して、ログの場所を決める。今回は "/var/log/zookeeper" とした。（これ不要かもしれない）
<pre>
dataDir=/tmp/zookeeper
dataLogDir=/var/log/zookeeper
</pre>
<strong>zookeeper ver3.3.3のzoo.cfgでは、コメントアウトしている設定まで読み込まれるっていうひどい仕様になっているので気をつけてください</strong>。結構はまりました。

例えば、zoo.cfgはこんな感じになります。
zookeeperも本来は複数台で使うものですが、とりあえず１台で動かします。
<pre>
# The number of milliseconds of each tick
tickTime=2000

# The number of ticks that the initial 
# synchronization phase can take
initLimit=10

# The number of ticks that can pass between 
# sending a request and getting an acknowledgement
syncLimit=5

# the directory where the snapshot is stored.
dataDir=/tmp/zookeeper
dataLogDir=/var/log/zookeeper

# the port at which the clients will connect
clientPort=2181

# server settings
server.1=localhost:2888:3888
#server.1=zookeeper1:2888:3888
#server.2=zookeeper2:2888:3888
#server.3=zookeeper3:2888:3888
</pre>

ついでに、必要があればzookeeperのlog4jの設定もしましょう。
やらなくても動きます。Consoleじゃなくてファイルにログを残したい場合だけ変えてください。

ディレクトリの作成も忘れずに。
<pre>
sudo mkdir /tmp/zookeeper
sudo mkdir /var/log/zookeeper
</pre>

     
<h3>zeromq & jzmq のインストール</h3>

以下の手順に従ってインストール。
<ul>
	<li><a href="https://github.com/nathanmarz/storm/wiki/Installing-native-dependencies">Installing native dependencies - GitHub</a></li>
</ul>

まずzeromq.
<pre>
wget http://download.zeromq.org/historic/zeromq-2.1.7.tar.gz
tar zxf zeromq-2.1.7.tar.gz
cd zeromq-2.1.7
./configure
make
sudo make install
</pre>
uuid-dev が無いと言われたら yum install uuid-devel

LD_LIBRARY_PATH に /usr/local/lib を追加しておく。
そのあと
<pre>
sudo ldconfig
</pre>

次に、jzmq.
<pre>
#install jzmq
git clone git://github.com/nathanmarz/jzmq.git
cd jzmq
./autogen.sh
./configure
make
sudo make install
</pre>
libtoolやautomake, autoconf, pkg-configなどがないと言われたらyum等で入れましょう。
 
<h3>python 2.6.6 インストール</h3>

centos5だとpython のバージョンが 2.4.3 だったので 2.6.6 を入れる。

以下を参考に、古いものを共存させながらインストール。

<ul>
	<li><a href="http://labs.beatcraft.com/ja/index.php?Python2.6.6%2FCentOS5">Python2.6.6/CentOS5 - labs.beatcraft.com</a></li>
</ul>


<h2>Stormのインストール</h2>
前の記事と同様です。
<a href="https://github.com/nathanmarz/storm/downloads">https://github.com/nathanmarz/storm/downloads</a> から最新のstormをダウンロードして、zipを解凍してください。（2011/12/27の最新verは0.6.0）

そして、storm-*.*.*/binにpathを通します。

<pre>
$ wget https://github.com/downloads/nathanmarz/storm/storm-0.6.0.zip --no-check-certificate
$ unzip storm-0.6.0.zip
$ sudo cp -R storm-0.6.0 /usr/local/
$ export STORM_HOME=/usr/local/storm-0.6.0
$ export PATH=$PATH:$STORM_HOME/bin
</pre>

今回はここまで。
次回は、１台のマシンでnimbusもsupervisorも動かして、クラスタモードでサンプルプログラムを動かすところまでを書きます。

続き&darr;
<ul>
 <li><a href="http://tjun.jp/blog/2012/04/storm-cluster-setup2-one/">stormのcluster環境のセットアップ&amp; storm UIを試す (後編1: １台で全て動かす) | tjun memo</a></li>
</ul>

参考になりそうな日本語サイト
<ul>
	<li><a href="http://d.hatena.ne.jp/acro-engineer/20111123/1322059295">Twitter Stormをインストールしてみます！（その１ - Taste of Tech Topics</a></li>
</ul>
