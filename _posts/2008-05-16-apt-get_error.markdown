---
layout: post
status: publish
published: true
title: apt-getのエラーの対処（ubuntu, debian）
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 355
wordpress_url: http://zzz.jeeet.net/?p=9
date: 2008-05-16 00:28:54.000000000 +09:00
categories:
- ubuntu
tags:
- ubuntu
- linux
- debian
comments: []
---
ここに示すのは，あくまでひとつの可能性であり，必ず解決できるというわけではありません．
また，無理矢理解決してるので，システムに悪影響を及ぼす可能性があります．自己責任でお願いします．


さて，ubuntuにおいて，いつものようにapt-get updateしようとしたらエラーがでました．

    E: ロック /var/lib/apt/lists/lock が取得できませんでした
    - open (11 Resource temporarily unavailable)
    E: list ディレクトリをロックできません
    
    （英語だと）
    Could not get lock /var/lib/dpkg/lock
      - open (11 Resource temporarily unavailable)

これは，前回のapt-get や aptitude が正常に終了されていない可能性があります．ということで，apt関係のプロセスがまた動いていないかを調べて，動いていたら，終了させましょう．

まず，ターミナルで，プロセスをみるコマンドをうちます．

    $ ps ax | grep apt

ps　というのは，プロセスを表示する，ということ．オプションのaxをつけているので，全て表示する　ということを意味します．その中からaptに関するものだけを表示します．

これをやると，

    11675 pts/0    T      0:00 apt-get update

あるいは

    4064 ?        Sl     0:02 aptitude install *******

こんな感じの部分がないですか?

これがあったらまだapt関係のプロセスが終了されていない，ということです．
荒療治ですが，強制的に終わらせます．

    11675 pts/0    T      0:00 apt-get update

この一番左の 11675　はプロセスの番号を表しています．この番号のプロセスを終了するには

    $ sudo kill -KILL 11675

でok．

これでまたapt-get updateできるようになるはずです．

    $ sudo apt-get update

<strong>--以下追記(2010/12/03)--</strong>

しかし，packageインストール中にプロセスの強制終了をやると，中途半端な状態が発生して，インストールしたかったパッケージを再びインストールしようとしたときにはまる場合があります。

その場合，まずは

    $ sudo dpkg --audit

でインストールが中断してしまっているパッケージを調べて，

    $ sudo apt-get -f install ******
    $ sudo dpkg --configure -a

を行ってから，再びインストールしてみてください。

それでもだめなら

    $ sudo dpkg --remove *******
で削除してから，再び

    $ sudo apt-get update
    $ sudo apt-get install ******

を試してみてください。
