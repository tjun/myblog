---
layout: post
status: publish
published: true
title: VistaにCygwinをインストールして設定
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 379
wordpress_url: http://zzz.jeeet.net/2008/07/vista%e3%81%abcygwin%e3%82%92%e3%82%a4%e3%83%b3%e3%82%b9%e3%83%88%e3%83%bc%e3%83%ab%e3%81%97%e3%81%a6%e8%a8%ad%e5%ae%9a/
date: 2008-07-13 13:33:59.000000000 +09:00
categories:
- Windows
tags:
- cygwin
- vista
- Windows
comments: []
---
vistaと相性の悪いと言われているcygwinですが，やっぱり必要なので入れました．
そのときのメモです．

[ad]

<strong>インストール</strong>は
<a href="http://www.cis.twcu.ac.jp/%7Eosada/comp2a/cygwin-vista.html">Cygwinのインストール(Windows Vista)</a>で、基本的な流れがわかります．

**追記**
上記のサイトがなくなってしまったようなので，少しだけ説明を追加します．

<ul>
	<li>まず、<a href="http://cygwin.com/" alt="cygwin.com">http://cygwin.com/</a> からsetup.exe をダウンロードして、実行します。</li>
	<li>次に、国内の適当なサーバを選択して、入れたいパッケージを適当に選択して、インストールします。</li>
</ul>


このままではなぜか正常に起動しないので、
<a href="http://blogs.yahoo.co.jp/eguchium/36260060.html">xtermのエラー防止</a>に書いてあるように
<pre>
１．cygwin、それに関わるすべてのアプリを終了させる。
２．/bin/ash.exeを実行。コマンドプロンプトからでもよいし、
       エクスプローラからash.exeをダブルクリックしてもよい。
３．$ /bin/rebaseall　を実行。「$」はプロンプトの意。
４．少し待つ。
５．プロンプトが帰ってきたら終了。
</pre>
を行っておきます。


これで使えると思います。


以下は好みに合わせて設定してください。

<strong>homeディレクトリの変更</strong>をしたいときは


「<strong>コントロールパネル</strong>」->「<strong>システム</strong>」-「<strong>詳細設定</strong>」->「<strong>環境変数</strong>」から「<strong>新規</strong>」で

例えば，
<pre>変数名：HOME
変数値：C:\Users\"ユーザ名"\Documents</pre>

にするとvistaのホームフォルダと統一できます.

自分はC:\Users\"ユーザ名"\cyg
にしました.

<strong>シェルをzshに変える</strong>には、
<a href="http://d.hatena.ne.jp/haradats/20061112/p4%3E%3Cspan%20class=" highlight="">Cygwinで<span class="highlight">ログインシェル</span>を変更する方法 - よそいき顔で</a>
を参考に、インストールしたcygwinフォルダにある「<b>cygwin.bat</b>」を
<pre>@echo off
C:
chdir C:\cygwin\bin
rem bash --login -i
zsh --login -i</pre>
に書き換えます．


そのほか
<a href="http://blog.lilyx.net/2008/02/22/vista-development-environment/">Vista上での開発環境を整える(愛用ツールの紹介)@like i loved you +</a>
を参考にいじってみました。
