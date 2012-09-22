---
layout: post
status: publish
published: true
title: Cygwinターミナルでのフォントを変える
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 381
wordpress_url: http://zzz.jeeet.net/?p=84
date: 2008-07-16 03:04:28.000000000 +09:00
categories:
- programming
- tips
- Windows
tags:
- cygwin
- meadow
- vista
- Windows
comments: []
---
Windows vistaとcygwinの環境です。

フォントを変えたいと思ってもMSゴシックしか選択できない．

Meadowのフォントの変更ならいくらでも出てくるのだが，cygwinのターミナルのフォントについてはなかなか有用な情報が見つからなかった．

でも，役に立つ情報を見つけた．（リンク先は現在はなくなっています）
■ <strong>コマンドプロンプトを快適にする3つのTips@fkino daiary</strong>


<blockquote>
[<strong>コントロールパネル</strong>]の[<strong>フォント</strong>]を開き、まずは使いたいフォントをインストールします。
次に<strong>レジストリ</strong>を変更します。
regedit（レジストリエディタ）で、[<strong>HKEY_LOCAL_MACHINE</strong>] - [<strong>SOFTWARE</strong>] - [<strong>Microsoft</strong>] - [<strong>Windows NT</strong>] - [<strong>CurrentVersion</strong>] - <strong>[Console</strong>] - [<strong>TrueTypeFont</strong>]を右クリックし、[<strong>新規</strong>] - [<strong>文字列値</strong>]で、"<strong>932.</strong>"を入力します。
</blockquote>


レジストリエディタの起動は、コマンドプロンプトで<strong>regedit</strong>と打つとできたと思います．



<blockquote>
その後、[932.]をダブルクリックして、フォント名（Osakaフォントの場合は"<strong>Osaka?等幅</strong>"）を入力します。
ここまでできたら、システムを再起動します。
再起動後、コマンドプロンプトのプロパティで追加したフォントが選択できるようになっていますので、設定を変更します。
Cygwinでも追加したフォントが選択できるようになります。</blockquote>


自分はこれを参考にOsakaフォントに変えました．

パソコン再起動しないとうまくいかないようです．
