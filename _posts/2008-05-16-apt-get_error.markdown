--- 
layout: post
title: "apt-get\xE3\x81\xAE\xE3\x82\xA8\xE3\x83\xA9\xE3\x83\xBC\xE3\x81\xAE\xE5\xAF\xBE\xE5\x87\xA6\xEF\xBC\x88ubuntu, debian\xEF\xBC\x89"
wordpress_id: 355
wordpress_url: http://zzz.jeeet.net/?p=9
date: 2008-05-16 00:28:54 +09:00
---
ここに示すのは，あくまでひとつの可能性であり，必ず解決できるというわけではありません．
また，無理矢理解決してるので，システムに悪影響を及ぼす可能性があります．自己責任でお願いします．


さて，ubuntuにおいて，いつものようにapt-get updateしようとしたらエラーがでました．
<pre>E: ロック /var/lib/apt/lists/lock が取得できませんでした 
- open (11 Resource temporarily unavailable)
E: list ディレクトリをロックできません

（英語だと）
Could not get lock /var/lib/dpkg/lock
  - open (11 Resource temporarily unavailable)
</pre>
これは，前回のapt-get や aptitude が正常に終了されていない可能性があります．ということで，apt関係のプロセスがまた動いていないかを調べて，動いていたら，終了させましょう．

まず，ターミナルで，プロセスをみるコマンドをうちます．
<pre>$ ps ax | grep apt</pre>
ps　というのは，プロセスを表示する，ということ．オプションのaxをつけているので，全て表示する　ということを意味します．その中からaptに関するものだけを表示します．

これをやると，
<pre>11675 pts/0    T      0:00 apt-get update
</pre>
あるいは
<pre>
4064 ?        Sl     0:02 aptitude install *******
</pre>
こんな感じの部分がないですか?

これがあったらまだapt関係のプロセスが終了されていない，ということです．
荒療治ですが，強制的に終わらせます．
<pre>11675 pts/0    T      0:00 apt-get update</pre>
この一番左の 11675　はプロセスの番号を表しています．この番号のプロセスを終了するには
<pre>$ sudo kill -KILL 11675</pre>
でok．

これでまたapt-get updateできるようになるはずです．
<pre>$ sudo apt-get update</pre>

<strong>--以下追記(2010/12/03)--</strong>

しかし，packageインストール中にプロセスの強制終了をやると，中途半端な状態が発生して，インストールしたかったパッケージを再びインストールしようとしたときにはまる場合があります。

その場合，まずは
<pre>$ sudo dpkg --audit</pre>
でインストールが中断してしまっているパッケージを調べて，
<pre>
$ sudo apt-get -f install ******  
$ sudo dpkg --configure -a
</pre>
を行ってから，再びインストールしてみてください。

それでもだめなら

<pre>$ sudo dpkg --remove *******</pre>
で削除してから，再び
<pre>$ sudo apt-get update
$ sudo apt-get install ******</pre>
を試してみてください。
