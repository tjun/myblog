--- 
layout: post
title: How to build jzmq in Mac OS X Lion
wordpress_id: 1120
wordpress_url: http://tjun.jp/blog/?p=1120
date: 2012-04-03 18:48:04 +09:00
---
I tried to build jzmq, but failed with the following error message:
<pre>
$ git clone https://github.com/zeromq/jzmq.git
$ cd jzmq
$ ./autogen.sh
$ ./configure
$ make
...
make[1]: *** No rule to make target `classdist_noinst.stamp', needed by `org/zeromq/ZMQ.class'.  Stop.
make: *** [all-recursive] Error 1
</pre>

Then, create "classdist_noinst.stamp", but failed with new error msg.
<pre>
$ touch src/classdist_noinst.stamp
$ make
...
make[1]: *** No rule to make target `org/zeromq/ZMQException.class, needed by `all'.  Stop.
make: *** [all-recursive] Error 1
</pre>

So, modify CLASSPATH
<pre>
$ cd src/
$ CLASSPATH=.:./.:$CLASSPATH javac -d . org/zeromq/ZMQ.java org/zeromq/ZMQException.java org/zeromq/ZMQQueue.java org/zeromq/ZMQForwarder.java org/zeromq/ZMQStreamer.java org/zeromq/ZContext.java org/zeromq/ZFrame.java org/zeromq/ZMsg.java
$ cd ..
$ make
 # success!
$ sudo make install
</pre>
