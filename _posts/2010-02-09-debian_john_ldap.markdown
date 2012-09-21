--- 
layout: post
title: "debian(ubuntu)\xE3\x81\xA7\xE5\xBC\xB1\xE3\x81\x84\xE3\x83\x91\xE3\x82\xB9\xE3\x83\xAF\xE3\x83\xBC\xE3\x83\x89\xE3\x81\xAE\xE4\xBA\xBA\xE3\x82\x92\xE8\xA6\x8B\xE3\x81\xA4\xE3\x81\x91\xE3\x82\x8B(LDAP\xE7\xB7\xA8)"
wordpress_id: 212
wordpress_url: http://tjun.jp/blog/?p=212
date: 2010-02-09 19:21:08 +09:00
---
とあるサーバでユーザアカウントが乗っ取られて攻撃の踏み台に使われるという被害にあったので、対策のためパスワードの強度のチェックを行いました。

LDAPで複数サーバのアカウントを管理するシステムだったので、作業はLDAPのmasterで行いました。


まず、パスワードチェックに用いるのは<a href="http://www.openwall.com/john/">johnというソフト</a>
aptで入ります。
<pre>$sudo apt-get install john</pre>

LDAPを使っていないならば、あとは
<ul>
	<li><a href="http://www.usupi.org/sysad/168.html">John the Ripper でパスワードをチェックする - いますぐ実践! Linuxシステム管理 / Vol.168</a></li>
</ul>
を参考にするとできると思います。


で、LDAP使ってる場合、パスワードファイルを引いてこなければならないので、まずはLDAPの情報を
/etc/ldap/ldap.conf　か　/etc/ldap/slapd.conf　と　/etc/ldap.secret
あたりを参照して、baseDNとadminDNとldappasswdを取得します。

<pre>
base: dc=test,dc=example,dc=com
admin: dn=ldapadmin,dc=test,dc=example,dc=com
passwd: *******
</pre>
のような感じです。

次に（もしかしたら必要ないかもしれませんが）
<pre>$sudo apt-get install libnet-ldap-perl </pre>
をやって、perlからldapを扱うライブラリを入れます。


そして、
<ul>
	<li><a href="http://people.binf.ku.dk/~hanne/blog/?postid=37">Getting John the ripper to run with LDAP SSHA passwords - Hanne's Blog - Bastard Operator in Heaven</a></li>
</ul>

からスクリプトをコピーして、先ほどメモしたbaseやpasswdを埋め、適当な名前で保存します。

（同じ動作をすると思われるプログラムが/usr/share/doc/john/examples/ldap-extractにもありますが、引数でパスワードを渡すのは嫌なので、使いませんでした。）

そのプログラムを使って
<pre>$ ./ldap-extract.pl > ldap_passwd</pre>
のようにしてやると、うまくいけばldap_passwdの中に
<pre>user1:{crypt}abcdefghi...:
user2:{crypt}123456778...:</pre>
のような感じの文字列が並びます。


こうしてできたファイルをjohnで解析します。

<ul>
	<li><strong>シンプルなチェック</strong></li>
これで引っかかる人はかなり弱いパスワードだと思われます。
<pre>$ john -single ldap_passwd</pre>

	<li><strong>辞書を用いたチェック</strong></li>
辞書はデフォルトのやつがたぶん /usr/share/john/password.lst　にあると思うのですが、日本用の辞書もどこからか入手できます（どこから持ってきたのか忘れてしまいました）
<pre>$ john -wordfile=/usr/share/john/password.lst ldap_passwd</pre>

	<li><strong>徹底的に調べる</strong></li>
どうしても知りたいなら、時間をかけてこれをやるのがいいらしいですが、時間がかかるのでユーザ名を指定した方がよさそうです。
<pre>$ john -incremental -users=[user1] ldap_passwd</pre>
</ul>

解析にてパスワードが分かると、
<pre>john -show ldap_passwd</pre>
で見ることができるようです。


悪用しないように。
