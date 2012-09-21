--- 
layout: post
title: "\xE3\x81\xAF\xE3\x81\x98\xE3\x82\x81\xE3\x81\xA6\xE3\x81\xAEMATLAB\xE3\x83\xA1\xE3\x83\xA2"
wordpress_id: 627
wordpress_url: http://tjun.jp/blog/?p=627
date: 2010-10-19 21:00:12 +09:00
---
はじめてMATLABを5時間くらい使ったのでメモ。

<strong><span style="color: #ff0000;">#結構検索して見に来てくれる人がいるのに内容なくて申し訳ないので、よさそうなサイトへのリンクを貼っておきます。</span></strong>
<ul>
	<li><a href="http://user.numazu-ct.ac.jp/~mochizuki-k/matlab/index.html">MATLAB</a></li>
	<li><a href="http://www.math.meiji.ac.jp/~mk/labo/text/matlab/">MATLAB 使い方入門</a></li>
	<li><a href="http://www.mathworks.co.jp/academia/student_center/tutorials/register.html?s_cid=0310_delg_1890_318222">MathWorks 日本 - MATLAB 入門チュートリアル 無料</a></li>
</ul>
<div class="amazlet-box" style="margin-bottom: 0px;">
<div class="amazlet-image" style="float: left; margin: 0px 12px 1px 0px;"><a name="amazletlink" href="http://www.amazon.co.jp/exec/obidos/ASIN/4434155911/tjun-22/ref=nosim/" target="_blank"></a><img src="http://ecx.images-amazon.com/images/I/41zxIxSa6zL._SL160_.jpg" alt="MATLABプログラミング入門" style="border: none;" /></div>
<div class="amazlet-info" style="line-height: 120%; margin-bottom: 10px;">
<div class="amazlet-name" style="margin-bottom: 10px; line-height: 120%;"><a name="amazletlink" href="http://www.amazon.co.jp/exec/obidos/ASIN/4434155911/tjun-22/ref=nosim/" target="_blank"></a>MATLABプログラミング入門
<div class="amazlet-powered-date" style="font-size: 80%; margin-top: 5px; line-height: 120%;">posted with <a title="MATLABプログラミング入門" href="http://www.amazlet.com/browse/ASIN/4434155911/tjun-22/ref=nosim/" target="_blank">amazlet</a> at 11.12.29</div>
</div>
<div class="amazlet-detail">上坂 吉則
牧野書店
売り上げランキング: 7572</div>
<div class="amazlet-sub-info" style="float: left;">
<div class="amazlet-link" style="margin-top: 5px;"><a name="amazletlink" href="http://www.amazon.co.jp/exec/obidos/ASIN/4434155911/tjun-22/ref=nosim/" target="_blank"></a>Amazon.co.jp で詳細を見る</div>
</div>
</div>
<div class="amazlet-footer" style="clear: left;"></div>
</div>
基本的な使い方は、分かる人が周りにいないとちょっと難しかったかもしれない。
フィルタの使い方とかhelp見ても難しかった。
でも、プログラム書くのは難しくはなかった。

今回書いたのは，24個のソースからの100HzのデータのCSVファイル(24列n行) がたくさんあって，そのデータにローパスフィルタをかけてからCSVファイルに保存する、っていうプログラム。

MATLABは行列でデータを処理していくのが正しい使い方で、要素毎にfor文で、っていうのはよくないみたい。

プログラムはこんな感じ。（一部省略）
MATLAB初心者なので、冗長な部分や間違ってる部分があると思います。

[matlab]
sourcepath = 'csv';
sourcefiles = dir(fullfile(sourcepath,'/*.csv'));
outpath = 'filtered_csv';

c=0;
for i=1:size(sourcefiles, 1)
    curfile = sprintf('%s/%s', sourcepath, sourcefiles(i).name);
    outfile = sprintf('%s/%d.csv', outpath, c);
    %curfile

    %read csv file
    data = csvread(curfile, 1, 1);

    %low pass filter
    [B, A] = butter(10, 1/5, 'low');
    answer = filter(B, A, data);

    dlmwrite(outfile, answer, 'precision', '%.5f');

    c = c+1;

end
[/matlab]

部分毎にメモ。

[matlab]
sourcepath = 'csv';
sourcefiles = dir(fullfile(sourcepath,'/*.csv'));
[/matlab]


csvディレクトリの、全てのcsvファイルを処理したい。
sourcefilesを後に出てくるfor文で一つずつ処理する。

[matlab]
c=0;
for i=1:size(sourcefiles, 1)
    curfile = sprintf('%s/%s', sourcepath, sourcefiles(i).name);
    outfile = sprintf('%s/%d.csv', outpath, c);
    %curfile
[/matlab]


ここのforループでsorcefilesに来るファイルを一つずつ処理。
cはカウンタ。
処理するファイル名ををcurfileに入れる。
出力するファイル名をoutfileに入れる。
%で始まる行はコメント。この行は，デバッグ時にcurfileを表示してた。行末にセミコロンを付けないと，行の結果が標準出力に出る。
変数名を書けば、その変数をプリントするような感覚?で使える。

[matlab]
data = csvread(curfile, 1, 1);
[/matlab]


curfileで指定するcsvファイルを読み込んで，dataに入れる。行列になる。
1, 1 というのは，１行目と１列目を除くっていう意味。今回扱うファイルは１行目、１列目に属性名が入っていたので、そこを除いて処理にかける。

たしかcsvreadっていう関数の中でdlmreadっていう関数が呼ばれる。

[matlab]
    [B, A] = butter(10, 1/5, 'low');
    answer = filter(B, A, data);
[/matlab]


10次のlowpassのButterworseフィルタを作って、係数をA, Bに代入。
参考:
<a href="http://ja.wikipedia.org/wiki/%E3%83%90%E3%82%BF%E3%83%BC%E3%83%AF%E3%83%BC%E3%82%B9%E3%83%95%E3%82%A3%E3%83%AB%E3%82%BF">バターワースフィルタ - Wikipedia</a>

1/5というのは，100Hzのデータに対して20Hz以上の部分をカットしてしまう、という意味。
係数を指定して、先ほど読み込んだ行列dataをfilterにかける。結果の行列をanswerに入れる。

[matlab]
dlmwrite(outfile, answer, 'precision', '%.5f');
[/matlab]


結果の行列answerをファイルに書き込み。
書き込むファイル名はoutfileから参照。

csvwriteという関数もあるけど、有効数字の指定をするためにdlmwriteを使ってる。

そんな感じ。
フィルタを簡単に使えるのがいい。たしかに慣れたら便利そう。
