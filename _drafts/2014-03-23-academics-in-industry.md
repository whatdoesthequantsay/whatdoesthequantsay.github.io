---
layout: post
title: "On the transition from academia to industry"
description: ""
author: stpyang
tags: [rant]
---
{% include JB/setup %}

*Note: This is an article which I have written and re-written
 countless times but always resisted publishing.  It is a topic which
 I find very personal, and generally speaking I do not like expressing
 my opinions online.  Despite my reservations, I've always wanted to
 discuss this publicly.  Through countless conversations with
 ex-academic researchers-turned industry, I noticed a certain
 emotional pattern which inevitably emerges because of a conflict of
 culture.  This is neither a good thing or a bad thing.  It just is.*

*Because of the personal opinions in this article I use the pronoun
 "I" instead of the usual "we."  What is expressed here are solely my
 own thoughts and do not necessarily reflect the voice of my better
 half.*

// INTRODUCTION

####

<meta property="og:image" content="/assets/images/she_wants_the_deep.jpg" />
<img style="float:left; width: 250px; padding:10px" src="/assets/images/she_wants_the_deep.jpg" alt=""/>

The finest compliment that a pure mathematician can receive on her
work is that it is "*deep*."  This is a strange metric because it's
hard to define.  However, you know it when you see it.  Deep is
beautiful and mind-blowing.  Deep is the reason why I became a
mathematician in the first place, and it is the reason why I did
algebraic geometry in particular.  I *love* deep.

As a postdoc, I didn't mind spending week after week trying to
understand the
[definition of a stack](http://en.wikipedia.org/wiki/Stack_(algebraic_geometry)#Definitions). In
fact, I fell in love with and married the man who best explained
stacks to me!  Statements like this?

>A descent datum consists roughly of a covering of an object $V$ of
>$C$ by a family $V_i$, elements $x_i$ in the fiber over $V_i$, and
>morphisms $f_{ji}$ between the restrictions of $x_i$ and $x_j$ to
>$V_{ij}=V_i×\union V_j$ satisfying the compatibility condition
>$f_{ki} = f_{kj}f_{ji}$.

This was the shit.  Sure it takes weeks and weeks to digest the
meaning of effective descent datum, but once you finally get it, it
feels awesome.

###Deep != productive###

In industry, deep can be a liability.

Academic papers are the starting point of many industrial mathematical
models.  However, they almost never translate directly real world
results.  Nowadays, if I ever decide that I want to use a result that
I found in a published paper, the inevitable next step is to a virtual
ratchet to their ideas and cut out all the stuff that is too academic.
Sometimes entire sections of these papers I read, representing months
or years of academic research, are reduced to a few hacky lines of
code in my model.  A part of me dies every time I do this, but I hae
no choice but to wipe a tear from my eye and carry on.

##Producing good models##
 
What makes a good quant or data scientist??  Ask ten people and you
will receive twenty answers.  I proporse that there four skills that
one must have in order to produce successful models:

A solid quantitative background.  Preferably this would include a fair
amount of statistics and probability, but the most important is the
ability to learn the quantitative tools you need on the job.

Next, one needs the ability to program.  Once again, the language of
choice doesn't matter so much as the ability to pick up what you need
on the job.  This is the first area where I see academics start to
fall short.

Lastly, one needs domain expertise.  If the proberbial devil lives in the
details, this is where all of the details live.  To be
specific, from my experience is primarily with trading futures on the
CME, in which case a high frequency quant must know the ins and outs
of the CME feeds and matchine engines and various flavors of orders
and quotes.  One needs to know commission structures, and the details
of spreads and implied orders (something which is unique to the CME as
far as I know) and how they are executed, and of course .  This is
only stuff at one exchange.  For those who want to use information
from other exchange the  None of this is particularly
interesting, and learning these details is not nearly as fun as learning
a new mathematical or programming technique, but its importance can
not be underestimated.  With out it, you're stuck knowing the rules of
a game without knowing how to play.

This is where I see the most academics fall short.  I have a vague
sense that the quants and scientists who have *not* gone to graduate
school struggle less with this issue than the ones who have, simply
because they spent less time being indoctrinated into academic culture
which dictated
