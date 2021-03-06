---
layout: post
title: "What does mean mean, really?"
description: ""
author: stpyang
tags: [stephanie,statistics]
category:
---
{% include JB/setup %}

[Shayne Fletcher is hooked on computer programming][shayne], and we are hooked
on his blog.  His most recent posts are a irresistible introduction to some
fundamental statistics via OCaml programming, among them a total of ***five***
different definitions of the mean value of a sequence.  In this post we continue
Shayne's discussion with a side dish of calculus and R thrown in for good
measure.  You should really read Shayne's blog posts on [statistics][statistics]
and [power means][powermeans] before you continue reading this.

<!-- more -->

Shayne introduces five different means: arithmetic, harmonic,
geometric, quadratic, and power.  Given a sequence of numbers
$$x_1,\ldots,x_n$$, the formulae for these five means are:

$$
\begin{align}
&\mathrm{harmonic\  mean}
&&\left(\frac{1}{n}\sum_{i = 1}^n x_i^{-1}\right)^{-1} \\
&\mathrm{arithmetic\ mean}
&&\frac{1}{n}\sum_{i = 1}^n x_i\\
&\mathrm{geometric\ mean}
&&\left(\prod_{i = 1}^n x_i\right)^{\frac{1}{n}}\\
&\mathrm{quadratic\ mean}
&&\left(\frac{1}{n}\sum_{i = 1}^n x_i^{2}\right)^{\frac{1}{2}}\\
&\mathrm{power\ mean\ (for\ }d \neq 0\mathrm{)}
&&\left(\frac{1}{n}\sum_{i = 1}^n x_i^{d}\right)^{\frac{1}{d}}
\end{align}
$$

It is evident that the harmonic mean, arithmetic mean, and quadratic
means are special cases of the power means when $$d=-1$$, $$d = 1$$,
and $$d = 2$$ respectively.  However, the geometric mean looks
like it doesn't fit in.

The power mean is undefined when $$d = 0$$ because of that pesky exponent
$$\frac{1}{d}$$.  However, since the power mean is defined for all nonzero value
of $$d$$, it is in particular defined for $$d$$ near zero and hence we can take
a limit. We even get to invoke [L'Hopital's
rule](http://en.wikipedia.org/wiki/L'Hôpital's_rule) along the way.

For ease of notation, let $$S(d)$$ represent the sum

$$S(d) = \frac{1}{n}\sum_{i = 1}^n x_i^d.$$

Notice that $$S(0) = 1$$ and

$$
S^\prime(d) = \frac{1}{n}\sum_{i = 1}^n x_i^d\mathrm{log}\;x_i,
$$

which implies that $$S^\prime(0) = \frac{1}{n}\sum_{i = 1}^n\mathrm{log}\;x_i$$.
Knowing both $$S(0)$$ and $$S^\prime(0)$$ allows us to calculate the limit of
the power means:

$$
\begin{align}
\lim_{d\to 0} S(d)^{\frac{1}{d}}
&= \lim_{d\to 0}\left(\mathrm{exp}\left(\frac{1}{d}\mathrm{log}\;S(d)\right)\right)\\
&= \mathrm{exp}\left(\lim_{d\to 0}\left(\frac{\mathrm{log}\;S(d)}{d}\right)\right)\\
&= \mathrm{exp}\left(\lim_{d\to 0}\left(\frac{S'(d)}{S(d)}\right)\right)\\
&= \mathrm{exp}\left(\frac{S'(0)}{S(0)}\right)\\
&= \mathrm{exp}\left(\frac{1}{n}\sum_{i = 1}^n \mathrm{log}\;x_i\right)\\
&= \left(\prod_{i = 1}^n x_i\right)^\frac{1}{n}.
\end{align}
$$

Thus the geometric mean is simply the limit of the power mean.

So now that we are viewing everything as special cases of power mean,
how do we go about interpreting the parameter $$d$$?  Well,
simply put, the greater that $$d$$ is, the closer that the power mean
will be to the maximal element in our sequence.  Conversely, power
means for negative values of $$d$$ are closer to the minimal element
of our sequence.

Let's visualize this using R, by generating a sequence of 100 samples
from the uniform distribution $$U(0,100)$$.  We plot the power mean of
this sequence against $$d$$ using the code below.

<pre>
{% include data/meanmean.r %}
</pre>

This code generates the pretty picture below.

<div class="media">
<a class="pull-left">
<meta property="og:image" content="/assets/data/meanmean.png" />
<img style="media-object; height:90%; width:90%;" src="/assets/data/meanmean.png" alt=""/>
</a>
</div>

You can see in this case that we have a progression harmonic mean < geometric
mean < arithmetic mean < quadratic mean, which is consistent with our
observation that the power $$d$$ in the power means formula represents how close
the mean will be to the smallest or largest element of our sequence (in this
case 1 and 99).  This is an example of the **generalized mean inequality**,
which states that if we define $$P_d$$ as

$$
\begin{align}
P_d =
  \left\{\begin{array}{ll}
  \left(\sum_{i=1}^n  x_i^d\right)^\frac{1}{d}, &\mathrm{if\ }d\neq 0, \\
  \left(\prod_{i=1}^n x_i\right)^\frac{1}{n}, &\mathrm{if\ }d=0
  \end{array}
  \right.
\end{align}
$$

then $$d_1 < d_2$$ implies $$P_{d_1}<P_{d_2}.$$

[shayne]: http://shayne-fletcher.blogspot.com
[statistics]: http://shayne-fletcher.blogspot.com/2014/03/statistics.html
[powermeans]: http://shayne-fletcher.blogspot.com/2014/03/power-means.html
