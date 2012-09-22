---
layout: post
status: publish
published: true
title: Thunderbirdの返信引用文「?さんは書きました」を英語に
author: tjun
author_login: tjun
author_email: t.junichiro@gmail.com
author_url: http://tjun.jp/blog/
wordpress_id: 374
wordpress_url: http://zzz.jeeet.net/?p=73
date: 2008-06-26 20:37:14.000000000 +09:00
categories:
- tips
- Firefox/Thunderbird
- Windows
tags:
- Thunderbird
- Tips
comments:
- id: 58
  author: KOR
  author_email: ''
  author_url: ''
  date: '2009-07-09 21:34:25 +0900'
  date_gmt: '2009-07-09 12:34:25 +0900'
  content: ! 'とっても参考になりました！

    ありがとうございます！'
- id: 59
  author: NICK
  author_email: ''
  author_url: ''
  date: '2009-07-27 10:34:18 +0900'
  date_gmt: '2009-07-27 01:34:18 +0900'
  content: これを探してました！ありがとうございます。
- id: 60
  author: ''
  author_email: ''
  author_url: ''
  date: '2009-09-09 14:00:53 +0900'
  date_gmt: '2009-09-09 05:00:53 +0900'
  content: ! 'とても参考になりました。

    ありがとうございます。'
- id: 62
  author: っつちさんさん
  author_email: ''
  author_url: ''
  date: '2009-09-22 04:16:16 +0900'
  date_gmt: '2009-09-21 19:16:16 +0900'
  content: ! 'とてもシンプルでわかりやすく、すぐに実践できる方法として非常に参考になりました。ありがとうございました。


    名前だけでなく、アドレスも載せることはできるのでしょうか？　


    よろしければご教示ください。よろしくお願いいたします。'
- id: 63
  author: っつちさんさん
  author_email: ''
  author_url: ''
  date: '2009-09-22 04:17:21 +0900'
  date_gmt: '2009-09-21 19:17:21 +0900'
  content: ! 'すみません、繰り返しになってしまいました。


    消し方がわからないので申し訳ありません。'
---
<div class="zemanta-img" style="margin: 1em; float: right; display: block;">
</div>
メールソフトでThunderbirdを使っている場合，日本語版のデフォルトでは返信で相手のメール本文を引用する際に，
<pre>○○ さんは書きました:</pre>
という文が付くと思います．

自分はこれが嫌で，変えたいと思いました．

[ad]

googleで調べてみたところ，

<a href="http://www.mozilla-japan.org/support/thunderbird/tips#beh_replyheader">http://www.mozilla-japan.org/support/thunderbird/tips#beh_replyheader</a>

がMozillaによる説明として出てきたのですが，ちょっと面倒です．

もっと簡単にできる方法を紹介します．

まず，「<strong>ツール</strong>」＞「<strong>オプション</strong>」＞「<strong>詳細</strong>」から「<strong>設定エディタ</strong>」を開きます．

(Ubuntuでは，「編集」＞「設定」＞「詳細」から）

「<strong>フィルタ</strong>」に<span style="color: #ff0000;"><strong>reply</strong></span><span style="color: #000000;">と入力すると，返信に関する設定が出てきます．</span>


<strong>mailnews.reply_header_authorwrote</strong>をダブルクリックして，書き換えます．

<strong>%s</strong>の部分には相手の名前が勝手に入るので，この部分は残してあとは好きなように変えてください．
自分は

<strong>%s wrote</strong>

にしました．これで
<pre>○○ wrote:</pre>
と表示されます．　次に，受信時間も入れてみます．

<strong>mailnews.reply_header_type</strong>をダブルクリックして，値を<strong>1</strong>から<strong>２</strong>にします．　これで，
<pre>(2008/06/26 19:00), ○○ wrote:</pre>
というように表示されます．

時刻にカッコがつくのが嫌なので，これもはずします．

<strong>mailnews.reply_header_ondate</strong>をダブルクリックして，<strong>(%s)</strong> を <strong>%s </strong>に書き換えます．

これで
<pre>2008/06/25 10:10, ○○○ wrote:</pre>
という感じになります．


以上です．自分の好きなように変えてみてください．
