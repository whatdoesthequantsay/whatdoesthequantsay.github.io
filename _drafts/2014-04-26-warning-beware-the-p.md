---
layout: post
title: "Warning! Beware the p"
description: ""
author: stpyang
tags: [statistics]
category:
---
{% include JB/setup %}

<meta property="og:image" content="/assets/images/bijou.jpg" />
<img style="float:left; width: 270px; padding:10px" src="/assets/images/bijou.jpg" alt="Bijou is wary!"/>

We recently stumbled onto a delightful demonstration called [Dance of the $$p$$
values][dance] by statistical cognition researcher [Geoff Cumming][cumming]. If
you have ten minutes to spare, we *highly recommend* that you watch this video.
If you don't have ten minutes to spare, then we can save you some time and
summarize the video with four words: "don't trust $$p$$ values."

<!-- more -->

The $$p$$ value is often associated with a technique called [statistical
hypothesis testing][testing], a sort of algorithmic litmus test to see if the
results of an experiment is "statisticall significant." The reasoning behind
$$p$$ values dates back to the 1770s, though they didn't become popular until
[Ronald Fisher][fisher] re-introduced them around 1920. Statistical hypothesis
testing ihis involves creating a [null hypothesis][null] (often called $$H_0$$)
and then calculating a $$p$$ value, which is the *probability of the observed
result plus more extreme results, if the null hypothesis is true.* In mathspeak,
this is expressed as

$$p = P(X \geq x_0 \mid H_0).$$

If the calculated $$p$$ value is below a certain threshold, usually $$x_0 =
0.05$$, one rejects the null hypothesis and declare the results significant.

The main problem with $$p$$ values is that they are easy to calculate and hard
to understand.  Indeed, we see far more literature dedicated to [explaining what
$$p$$ values are not][dozen] than to what $$p$$ values actually are.  Despite
this, $$p$$ values are quoted everywhere in areas such as medical research, and
are just as often miscalculated, misinterpreted, or downright abused.

Cumming's demonstration consists of simulating a simple experiment of sample
over and over again and looking at the resulting $$p$$ values. For his
simulations, he chooses a small sample size of 32, and the results are
astonishing. His first three simulations yield $$p$$ values of 0.000, 0.125, and
0.504.  This can be interpreted as one highly significant result and two results
of no statistical significance, all without changing any parameters of the
simulator at all.

Here we replicate his results in R.  We generate a control group of 32 samples
from a $$N(50, 20)$$ distribution, and a test group of 32 samples from a $$N(60,
20)$$ distribution.  Our null hypothesis $$H_0$$ is that the two populations
have the same mean.  To test this, we calculate the sample means $$s_1$$ and
$$s_2$$ and sample variances $$\sigma_1^2$$ and $$\sigma_2^2$$ of both groups.
Then we calculate the $$z$$ statistic, given by the formula

$$z = \frac{(s_2-s_1) - 0}{\sqrt{\frac{\sigma_1^2}{n_1} + \frac{\sigma_2^2}{n_2}}}.$$

Here $$n_1 = n_2 = 32$$. This measures how many standard deviations away from
$$0$$ that the difference of the sample means $$s_2-s_1$$ lie.  If the null
hypothesis were true, this should be $$0$$.  The $$p$$ value is then
$$\Phi^{-1}(z)$$, where $$\Phi$$ is the cdf of the standard normal distribution
$$N(0,1)$$.

<pre>
{% include data/pValues.r %}

=== output below ===

[1] 669
[1] 331
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max.
0.000000 0.003175 0.019120 0.076980 0.083920 0.932800
</pre>

This yields the pretty histogram below.

<img style="float:middle; width: 360px; padding:10px" src="/assets/data/pHist_32.png" alt=""/>

In particular, we see that among 1000 simulated experiments, we have

* 655 simulations with $$p$$ values less than or equal to $$0.05$$, thus
  statistically significant by convention

* 345 with $$p$$ values that are not significant

* A minimum $$p$$ value of 0.00

* A maximum $$p$$ value of 0.89

With a sample size of only 32, the $$p$$ value is not a reliable measure of
anything!

Unfortunately, it is not uncommon for experimental studies e.g. clinical trials
to be this small.  Sometimes this the case for legitimate reasons such as cost
and/or availability, and other times the researchers simply don't know or don't
care about statistical rigor.  This has led to a plethora of published studies
with irreproducible results.

Not surprisingly, changing the sample size to 10 or 100 makes the histogram of
simulated $p$ values much wider or much tighter. We ran our simulated
experiments again, changing only the value of ```samplesPerExperiment``` to 10
and 100. This yielded the following two histograms for $$p$$ values.

<img style="float:left; width: 270px; padding:10px" src="/assets/data/pHist_10.png" alt=""/>
<img style="float:right; width: 270px; padding:10px" src="/assets/data/pHist_100.png" alt=""/>

The small sample size 10 generated 306 out of 1000 simulations yielding a $$p$$
value of below 0.05. The histogram of $$p$$ values is on the left. Although
these could be labelled as "statistically significant" by an unscrupulous
researcher, we claim that none of the results are particularly significant; they
just happen to be lucky.

The larger sample size 100 generated 976 out of 1000 $$p$$ values that were below
the 0.05 threshold. The histogram of $$p$$ values is on the right. The $$p$$
value in this case is much more reliable. Perhaps we should revise our original
statement to say "don't trust $$p$$ values *for small sample sizes*."

We encourage our readers to tinker with our R code above to generate histogram
of $p$ value under varying conditions.

[dance]: https://www.youtube.com/watch?v=ez4DgdurRPg
[cumming]: http://thenewstatistics.com
[testing]: https://en.wikipedia.org/wiki/Statistical_hypothesis_testing
[fisher]: https://en.wikipedia.org/wiki/Ronald_Fisher
[null]: https://en.wikipedia.org/wiki/Null_hypothesis
[dozen]: http://www.tc.umn.edu/~alonso/Goodman_Semin_Hemat_2008.pdf
