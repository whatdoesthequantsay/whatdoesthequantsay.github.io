---
layout: post
title: "What does mean really mean?"
description: "The rent is too damn high...or is it?"
author: stpyang
tags: [statistics]
---
{% include JB/setup %}

![alt text](http://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Jimmy_McMillan_Blue_2_2011_Shankbone.jpg/220px-Jimmy_McMillan_Blue_2_2011_Shankbone.jpg
 "jimmy mcmillan does not approve") 

In a
[recent editorial on the the rental market in New York](http://www.amny.com/opinion/editorial/editorial-nyc-s-big-challenge-is-to-hold-costs-down-1.7296517),
the editorial board of AM-NY made an statistical error of the most
fundamental type when they wrote:

>*The city's median household income is more than $52,000 a year. And
> the average rent in the city is upward of $3,000 a month -- or
> $36,000-plus a year.* *Which means?*

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

<img style="float:left; width: 550px; padding:10px" src="/assets/data/2014-03-08_household_income.png" alt=""/>

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

<img style="float:left; width: 550px; padding:10px" src="/assets/data/2014-03-08_gross_rent_as_percentage_of_household_income.png" alt=""/>

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
her income on rent than the typical American at large!  This is most
like due to three factors:

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

We do not disagree with AM-NY's assesment.  In New York, apartment
rents are too damn high!  However, we simply cannot turn off our
disdain for bad statistics whenever we watch TV or read the news.
Journalists, please don't abuse the statistics!
