--- 
layout: post
title: "ubuntu\xE3\x81\xA7iTunes\xE3\x82\xB5\xE3\x83\xBC\xE3\x83\x90\xE3\x83\xBC\xE3\x82\x92\xE5\xAE\x9F\xE7\x8F\xBE"
wordpress_id: 311
wordpress_url: http://zzz.jeeet.net/?p=311
date: 2009-04-29 02:38:41 +09:00
---
<div class="zemanta-img" style="margin: 1em; display: block;">
<div><dl class="wp-caption alignright" style="width: 250px;"> <dt class="wp-caption-dt"><a href="http://www.flickr.com/photos/84018923@N00/41431385"><img title="Apple iTunes 5.0" src="http://farm1.static.flickr.com/27/41431385_045abf7b4b_m.jpg" alt="Apple iTunes 5.0" width="240" height="173"></a></dt> <dd class="wp-caption-dd zemanta-img-attribution" style="font-size: 0.8em;">Image by <a href="http://www.flickr.com/photos/84018923@N00/41431385">cd.harrison</a> via Flickr</dd> </dl></div>
</div>
iTunesサーバーがあれば、同じネットワークにあるPCがiTunesを起動すると、iTunesサーバーの持つ曲を自由に再生できるようになります。

つまり，自分が立てたiTunesサーバーに入れた曲を，家族がPCを付けてiTunesを起動するだけで再生可能になります．なかなか便利．

まずは余っているPCに，必要であればHDDを増設して，linuxを入れます．

で、mp3を再生できる環境を整えます．

で，iTunesサーバーはfirefly(mt-daapd)というものが使えます．

ubuntu，debianであれば

<pre>
sudo apt-get install mt-daapd</pre>
で導入は終了．

もしかしたらmp3を再生するためにいくつかライブラリが必要かもしれません．

あとは，設定を行います．

<pre>
sudo vim /etc/mt-daapd.conf</pre>
と，vim などのエディタで設定ファイルを開き，

音楽ファイルを置く場所を

<pre>mp3_dir = /home/music/</pre>

など好きなディレクトリに書きなおします．

iTunesから見える名前は，

<pre>servername = jun's music</pre>
など設定を変えられます．

設定を変えた後は

<pre>sudo /etc/init.d/mt-daapd restart</pre>

で，リスタートすると設定が反映されるかと思います．

曲がうまく認識されない場合は，
<ul>
	<li>曲を置いたディレクトリの場所の設定</li>
	<li>曲を置いたディレクトリのパーミッション</li>
	<li>曲(mp3)のパーミッション</li>
</ul>
などを確認してみる．




<div style="margin-top: 10px; height: 15px;" class="zemanta-pixie"><img style="border: medium none ; float: right;" class="zemanta-pixie-img" src="http://img.zemanta.com/reblog_e.png?x-id=a5842871-76e4-43aa-996b-1a876f2eb721" alt="Reblog this post [with Zemanta]"><span class="zem-script more-related pretty-attribution"><script type="text/javascript" src="http://static.zemanta.com/readside/loader.js" defer="defer"></script></span></div>
