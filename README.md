Interval Overlap algorithm in Ruby
=============

Solution to the overlapping intervals problem (aka license usage) in ruby 1.9.3. The code requires the rbtree gem 
<pre><code>gem install rbtree</code></pre> to store the intevals sorted. The tests cover some functional sceanarios as well as a few performance tests generating up to 10 
million random intervals and calculating the maximum overlap among them.
