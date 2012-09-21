--- 
layout: post
title: "\xE3\x81\x95\xE3\x81\x8F\xE3\x82\x89VPS\xE3\x81\xA7\xE3\x82\xB7\xE3\x83\xB3\xE3\x82\xB0\xE3\x83\xAB\xE3\x83\xA6\xE3\x83\xBC\xE3\x82\xB6\xE3\x83\xA2\xE3\x83\xBC\xE3\x83\x89\xE3\x81\xAB\xE5\x85\xA5\xE3\x82\x8B"
wordpress_id: 1131
wordpress_url: http://tjun.jp/blog/?p=1131
date: 2012-05-02 22:19:43 +09:00
---
さくらVPSを利用していて、少し前に障害に伴ってOSの再起動がありました。
そしたら起動できなくなっちゃって、さくらVPSのサポートに問い合わせたところ、シングルユーザモードで起動する方法を教えてもらいました。
設定が何か間違っていて、マシン再起動時に立ち上がらないときは、シングルユーザモードで立ち上げて、問題の解決ができることがあります。

教えてもらったのはデフォルトのCentosの場合の方法で、カスタムOSは出来るかわかりません、ということでした。
自分はUbuntuなので、同じ方法ではうまく行かず、いろいろやったところ最終的には動いたけど結構はまりました。


※ 真似する場合は自己責任でお願いします。

<h3>まずCentosの方法</h3>

※ シングルユーザモードは「標準OS」をご利用いただいている場合の
  操作方法のみのご案内となります。
　カスタムOSの場合、OSのインストール方法により内容が異なります
  ため弊社ではご案内しておりません。
※ シングルユーザモードによるトラブルに関して、弊社では一切責任を
　負いかねます。

＜シングルユーザーモード＞

1.VPSコントロールパネルのホームを開き、再起動ボタンを押す。

2.すばやく、リモートコンソールボタンを押し、以下の画面で
　Enterキーを押す
<pre>
　Connected to domain www****u.sakura.ne.jp
　Escape character is ^]
</pre>

3.以下の画面で、更にEnterキーを押す。
　※OSが起動してしまった場合は1.からやり直してください。
　※2.の時から連続してEnterキー押下することでログインしやすくなります。
<pre>
　Booting CentOS5 (2.6.**-***.**.*.***) in * seconds ....
</pre>

4.GRUBが起動します。

　GNU GRUB  version 0.9*  (636K lower / 523244K upper memory)

5.ご利用のカーネルに合わせます。
　カーネルが複数表示される場合もございます。

6.[e]キーを押して editモードへ入り、カーソルキーで以下の行に合わせます。
<pre>
kernel /vmlinuz-2.*.**-***.**.*.** ro root=LABEL=/ console=tty0 cons>
</pre>

7.更に[e]キーを押して editモードへ入り、以下のように半角スペースと
　半角数字の「1」を入力し、Enterキーでeditモードから抜けてください。

　編集前
　le=tty0 console=ttyS0,115200n8r

　編集後
　le=tty0 console=ttyS0,115200n8r 1

8.GRUBの画面で[b]キーを押下しOSをリブートしてください。
　OSの起動が終了するまでしばらく待ちます。

9.以下の画面になれば、シングルユーザモードでログインされています。
<pre>
　Telling INIT to go to single user mode.
　INIT: Going single user
　INIT: Sending processes the TERM signal
　INIT: Sending processes the KILL signal
　sh-3.2#
</pre>
10.root状態でログインされていますので、サーバ内の調査をお願い
　 いたします。



<h3> ubuntuの場合 </h3>
1.VPSコントロールパネルのホームを開き、再起動ボタンを押す。

2.すばやく、リモートコンソールボタンを押し、以下の画面で
　F1とかF3とかその辺のキーを押しまくる
<pre>
　Connected to domain www****u.sakura.ne.jp
　Escape character is ^]
</pre>
3, うまくいくと以下のような画面になります。

<img src="http://tjun.jp/blog/wp-content/uploads/2012/04/QEMU1.jpg" alt="QEMU" title="QEMU.jpg" border="0" width="400" height="281" />


4, あとはrootでログインして、起動失敗している原因を調査します。



自分の場合は、nginxの設定にあるディレクトリが、再起動で消えるディレクトリを設定してしまっていて起動に失敗しているのが原因でした。


OS再インストールすることなく無事に復帰できたのでよかったです。
