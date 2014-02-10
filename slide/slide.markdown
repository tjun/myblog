---
layout: slide
title: slide
style: swiss
transition: horizontal-slide
---

<section class="slide">

# このスライドの作り方 <br /><em>@tjun</em> #

</section>

<section class="slide">

## 概要 ##

このスライドは、[deck.js](http://imakewebthings.com/deck.js/)を使って作られています。
[jekyll](https://github.com/mojombo/jekyll)と組み合わせることで、markdownで書いてHTMLへ変換してスライドにしてます。

</section>
<section class="slide">

## たとえば、、、 ##

一つ前のスライドは、これだけ書いてます。

    <section class="slide">
    
    ## 概要
    
    このスライドは、[deck.js](http://imakewebthings.com/deck.js/)を使って作られています。
    [jekyll](https://github.com/mojombo/jekyll)と組み合わせることで、markdownで書いてHTMLへ変換してスライドにしてます。
    
    </section>

`<section>` で囲まれる部分がスライド1枚になってます。

</section>

<section class="slide">

## YAML

markdownの先頭では、以下のようなパラメータを指定します。
laytoutは、自分でつくりました。[\[_layouts/slide.html\]](https://github.com/tjun/myblog/blob/master/_layouts/slide.html)

styleとtransitionはdeck.jsに含まれるテーマが使えます。
titleは、htmlのタイトルになるだけなので、スライドには登場しません。

    ---
    layout: slide
    title: slide
    style: swiss
    transition: horizontal-slide
    ---


</section>
<section class="slide">

## おわり

githubに置きました。

* [github](https://github.com/tjun/myblog/tree/master/slide)

</section >
