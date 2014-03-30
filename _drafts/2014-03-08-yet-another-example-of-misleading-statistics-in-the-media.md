---
layout: post
title: "Penis pumps and NYC apartments"
description: "Statistics and the media"
author: stpyang
tags: [statistics, fundamentals, nyc, penispump]
---
{% include JB/setup %}

No journalist should be allowed to publish unless they demonstrate a
solid understanding of statistics.  Too often, the media fails to use
data properly; rather, they *abuse* data in order to lend credibility
to subpar reporting habits, because quoting a statistic lends an air
of authenticity to an argument.  After, just listen to the persuasive
tone with which Ilyse Hogue declares that 
[fedarally funded penis pumps have made their way into congress](http://www.thewrap.com/daily-show-exposes-172-million-federal-penis-pump-spending-video/)
(start listening at 4:00)

> *Statistics show that probably some members of congress have a vested
> interested in having penis pumps covered by medicare!*

Is this true?  Ilya's wording is vague, but her tone of voice is
authoritative.  Let's run through the calculations:

1. According to the report, medicare has spent $172 million on penis
pumps, at the cost of $360 each.  That's a total of 477,778 total
penis pumps bought from 2006 to 2011.

2. [45% of the current 49,435,610 medicare recipients are
male](http://kff.org/medicare/state-indicator/medicare-beneficiaries-by-gender/),
which means there is one penis pump every 46.5 males on medicare.
Inverting this number, about 2.15% of males on medicare receive a
penis pump (assuming of course that nobody received two!).

3. There are currently 32 senators and 96 members of the house who are
medicare-eligible males.  The probability of *none* of them receiving
a penis pump from medicare is approximately:

$$0.9785^{128} \approx .0619$$

About 6.19%.  In other words, the chances of *at least* one member of
congress having a medicare-funded penis pump is then 93.8%.  This is
just shy 95% confidence interval that most statistians agree is
significant.  In order to have 95% confidence in congressional
geriatric penis pumps, one would need to have a total of 138
medicare-eligible males in congress, which has not happened yet.

Ilyse is close but still shy of statistical certainty, which accounts
for the vague wording of her statement: "Statistics show that this is
*probably* true."

The problem with statistics in the media is, to quote Mark Twain:
"Facts are stubborn things, but statistics are more pliable."

##The rent is too damn high...or is it?

![alt text](http://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Jimmy_McMillan_Blue_2_2011_Shankbone.jpg/220px-Jimmy_McMillan_Blue_2_2011_Shankbone.jpg
 "jimmy mcmillan does not approve") 

In a [am recent editorial on the the rental market in New
York](http://www.amny.com/opinion/editorial/editorial-nyc-s-big-challenge-is-to-hold-costs-down-1.7296517),
the editorial board displayed an egregious statistical error of the
most fundamental type when they wrote:

>*For example: The city's median household income is more than $52,000
> a year. And the average rent in the city is upward of $3,000 a month
> -- or $36,000-plus a year.*
>
>*Which means?*

###Comparing income to rent Part I

What *does* this mean?  Almost nothing, because *median* and *mean* are
fundamentally different statistics about distributions.  The only
thing that they share in common is that, they try to present what a
"typical" or "middle" element of a population might be like, but they
do so in fundamentally different ways.  Income and apartment rental
prices are highly skewed distributions which are textbook examples of
where these two ideas diverge.

Understanding median versus mean is not rocket science.  It has been
covered
[again](http://www.thomasjstanley.com/blog-articles/48/Average_Rich_or_Median_Poor.html)
and
[again](http://www.payscale.com/compensation-today/2011/11/mean-vs-median)
and [again](http://www.diffen.com/difference/Mean_vs_Median) by
textbooks, teachers, and blog posts.

Below is a histogram of distribution of household income in the
U.S. from data we scraped from the U.S. Census Bureau of Labor
Statistics.  The vertical bars represent income ranges of width $5,000
for values up to $200,000, which is roughly the 95% percentile of
household income.

![alt text]({{ site.url }}/assets/images/2014-03-08_household_income.png "see the skew!?!?") 

Because the distribution is asymetrically skewed to the right, the *median* household income is a hair aboe
$60,000 and lies in orange bar.  The *mean* household income is just
above $70,000 and lies in the blue bar.

A distribution of apartment prices in NYC would be similarly skewed to
the right, with the median lying below the mean.  By comparing the
*median* house income to the *mean* apartment price, AM-NY
purposefully and greatly exaggerated the amount that typical New Yorkers pay in rent.

###Income versus rent, part II

Media and mean aside, there is fundamental fact that the editorial
also failed to mention.  [Almost a quarter households in New York
County own their apartments.](http://factfinder2.census.gov) The
average income statistic that they quoted should have excluded
non-renters from their data point.  A direct comparison of gross rent
as a percentage of income is available from [American Community
Survey](https://www.census.gov/acs/www/)

![alt text]({{ site.url }}/assets/images/2014-03-08_gross_rent_as_percentage_of_household_income.png
 "?") 

Orange represent the distribution for New York County (557,868 sampes)
and the blue represents the distribution for the entire United States
population (38,681,971 samples).  One take-away from this data is that
the American Community Survey should *really* extend the number of
bins used in their survey, because the highest proportion of folks
being lumped into the category on the right obfuscates the true
distribution.  However, more importantly, this graph shows that York
distributions are relatively higher among the NYC data points.  The
proportion of New York County residents who pay less than 10% of their
income in rent is an astounding 2.27 times higher than the national
proportion.  Similarly, the proportion of New York County residents
who pay more than 50% of their national income is 13% lower than the
national proportion.  The typical New Yorker actually spends *less* of
her income on rent than the typical American at large.  This is most
like due to two factors:

1. Exceptionally high real estate prices in New York cause a majority
   of working professionals rent, even with inome from jobs from
   high-paying sectors such as tehnology and finance.

2. Most apartment complexes outside of major metropolitan areas like
   New York cater to people with from a lower income class than
   average.

3. Often-abused rent control and rent stabilization laws in New York
   keeps apartment prices far below market price for a significant
   number of apartments.

###Summary

We do not disagree with either the Daily Show or AM-NY.  The outcry of
federally-funded birth control *is* ridiculous when compared to the
number overnment-funded geriatric penis pumps that have attracted no
controversy at all.  In New York, apartment rents are too damn high!
However, we simply cannot turn off our quantishness whenever we watch
TV or read the news.  Journalists, please don't abuse the statistics!
