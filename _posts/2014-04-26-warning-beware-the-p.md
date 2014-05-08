---
layout: post
title: "Warning: Beware the p!"
description: ""
author: stpyang
tags: [statistics]
category:
---
{% include JB/setup %}

<meta property="og:image" content="/assets/images/bijou.jpg" />
<img style="float:left; width: 300px; padding:10px" src="/assets/images/bijou.jpg" alt="Bijou beware!"/>

We recently stumbled onto a delightful demonstration called [dance of the $$p$$
values][dance] by statistical cognition researcher [Geoff Cumming][cumming]. If
you have ten minutes to spare, we *highly recommend* that you watch this video.
If you don't have ten minutes to spare, then we can save you some time and
summarize the video in three words: "don't trust $$p$$."  In the video, Cumming
sets up a series of experiments to demonstrate the fickleness of the $$p$$.  In
this post we reproduce his demonstration in R.

<!-- more -->

The $$p$$ value is usually associated with a technique called [statistical
hypothesis testing][testing], which is a sort of algorithmic litmus test to see
if the results of an experiment is "statistically significant." The reasoning
behind $$p$$ values dates back to the 1770s, though they didn't become popular
until [Ronald Fisher][fisher] re-introduced them around 1920. Statistical
hypothesis testing involves choosing a [null hypothesis][null] (often called
$$H_0$$) and then calculating a $$p$$ value, which is the ***probability of a
result at least as extreme as the one observed, if the null hypothesis is
true.*** In mathspeak, we express this as:

$$p = P(X \geq x_0 \mid H_0).$$

If the calculated $$p$$ value is below a certain threshold, usually $$p \leq
0.05$$, one rejects the null hypothesis and declares the results significant.

The main problem with $$p$$ values is that they are easy to calculate and hard
to understand. Indeed, we see far more literature dedicated to [explaining what
$$p$$ values are not][dozen] than to what $$p$$ values actually are. Despite
this, $$p$$ values are quoted everywhere in areas such as medical research, and
are just as often miscalculated, misinterpreted, or downright abused. Even
worse, $$p$$ values are an overrepresented ingredient in many important
decisions, such as the difference between publishing a study or not, decisions
about receiving tenure or not, or decisions involving public policy.

Cumming's demonstration consists of a series of simulated experiments. He takes
samples from two normal distributions with different means, and calculates the
$$p$$ value corresponding to the difference of the means (his null hypothesis is,
presumably, that the means of the two distributions are the same).  Then he does
it again, and again and again. The results are astonishing. His first three
simulations yield $$p$$ values of 0.000, 0.125, and 0.504.  This can be
interpreted as one highly significant result and two results of no statistical
significance, and this is all done without changing any parameters of the
experiment.

Here we replicate his results in R.  We generate a control group of $$n=32$$
samples from a $$N(50, 20)$$ distribution, and a test group of $$n=32$$ samples
from a $$N(60, 20)$$ distribution.  Our null hypothesis $$H_0$$ is that the two
populations have the same mean.

We secretly know that the two populations were artificially generated from
standard normal variables with prescribed parameters, but for the rest of the
experiment we must ignore this fact.  We calculate the *sample means* $$m_1$$
and $$m_2$$ and *sample variances* $$s_1^2$$ and $$s_2^2$$ of both groups, and
use these to create a $$t$$-statistic given by the formula

$$t=\frac{(m_1-m_2)-0}{\sqrt{\frac{s_1^2}{n}+\frac{s_2^2}{n}}}.$$

This statistic is one sample from a distribution equal to [Student's
t-distribution][student] with $$2(n-1)$$ degrees of freedom.  The $$p$$ value is
then

<div>
$$p=F(-\left|t\right|)+1-F(\left|t\right|)$$
</div>

where $$F$$ is the cdf of the $$t$$-distribution. This expresses the probability
that the absolute value of a random sample from the $$t$$-distribution is at
least $$\left|m_1-m_2\right|$$. The function $$F$$ is given by a formula too
ugly to reprint here but accessible in R by invoking the ```pt``` function.

<pre>
{% include data/pValues.r %}

=== output below ===

[1] 528
[1] 472
     Min.   1st Qu.    Median      Mean   3rd Qu.      Max.
0.0000017 0.0086350 0.0418600 0.1444000 0.1918000 0.9951000
</pre>

This yields the pretty histogram below.

<img style="float:middle; width: 375px; padding:10px" src="/assets/data/pHist_32.png" alt=""/>

In particular, we see that among 1000 simulated experiments, we have

* 528 simulations with $$p$$ values less than or equal to 0.05, thus
 statistically significant by convention

* 472 with $$p$$ values that are not significant by the same convention

* A minimum $$p$$ value of 0.0000017

* A maximum $$p$$ value of 0.9951

This yields an almost 50/50 split between "significant" and "not significant".
With a sample size of only 32, the $$p$$ value is not a reliable measure of
anything!

Unfortunately, it is not uncommon for experimental studies e.g. clinical trials
to be this small. This has led to an overabundance of published medical studies
with irreproducible results. Sometimes this the case for legitimate reasons such
as cost and/or availability, and other times the researchers simply don't know
or don't care about statistical rigor.

Not surprisingly, changing the sample size to 10 or 100 makes the histogram of
simulated $$p$$ values much wider or much tighter. We ran our simulated
experiments again, changing only the value of ```samplesPerExperiment``` to 10
and 100. This yielded the following two histograms for $$p$$ values.

<img style="float:left; width: 270px; padding:10px" src="/assets/data/pHist_10.png" alt=""/>
<img style="float:right; width: 270px; padding:10px" src="/assets/data/pHist_100.png" alt=""/>

The small sample size 10 had 189 out of 1000 simulations yielding a $$p$$
value of below 0.05. The histogram of $$p$$ values is on the left. Although
these could be labelled as "statistically significant" by an unscrupulous
researcher, we claim that none of the results are particularly significant; they
just happen to be lucky.

The larger sample size 100 had 943 out of 1000 simulations yielding a $$p$$
value of below 0.05. The histogram of $$p$$ values is on the right. The $$p$$
value in this case is much more reliable. Perhaps we should revise our original
statement to say "don't trust $$p$$ *for small experiments*."

We encourage our readers to tinker with our R code above to generate more
histograms of $$p$$ values under varying conditions.

[dance]: https://www.youtube.com/watch?v=ez4DgdurRPg
[cumming]: http://thenewstatistics.com
[testing]: https://en.wikipedia.org/wiki/Statistical_hypothesis_testing
[fisher]: https://en.wikipedia.org/wiki/Ronald_Fisher
[null]: https://en.wikipedia.org/wiki/Null_hypothesis
[dozen]: http://www.tc.umn.edu/~alonso/Goodman_Semin_Hemat_2008.pdf
[student]: https://en.wikipedia.org/wiki/Student%27s_t-distribution
