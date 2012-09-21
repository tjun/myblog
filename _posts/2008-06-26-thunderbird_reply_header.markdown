--- 
layout: post
title: "Thunderbird\xE3\x81\xAE\xE8\xBF\x94\xE4\xBF\xA1\xE5\xBC\x95\xE7\x94\xA8\xE6\x96\x87\xE3\x80\x8C?\xE3\x81\x95\xE3\x82\x93\xE3\x81\xAF\xE6\x9B\xB8\xE3\x81\x8D\xE3\x81\xBE\xE3\x81\x97\xE3\x81\x9F\xE3\x80\x8D\xE3\x82\x92\xE8\x8B\xB1\xE8\xAA\x9E\xE3\x81\xAB"
wordpress_id: 374
wordpress_url: http://zzz.jeeet.net/?p=73
date: 2008-06-26 20:37:14 +09:00
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
