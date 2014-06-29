---
layout: post
title: "How to stay alive...underwater (Part 1)"
description: ""
author: stpyang
tags: [scuba]
category: 
---
{% include JB/setup %}

Memorial Day and warm weather are finally here.  For us, this means a chance
to dust off our scuba gear and spend some quality time underwater,
logging training dives at [our local scuba park][dutchsprings] in order to
prepare for an upcoming [GUE Fundies][guefundies] course in July.

There are few activities that we enjoy more than scuba diving, and
staying alive is definitely one of them. Thus in order to enjoy our
diving we need to be confident in our safety. There are enough factors
which contribute to safe diving to fill many many volumes and fuel
endless debate, but in this post we will focus on air consumption. To
be a little pedantic, the two of us almost never use the term "air"
when we dive, since we usually fill our cylinders with
[enriched air nitrox][nitrox], so for the rest of the post we will use
the neutral term "gas" instead of "air".

When we are underwater, we constantly monitor the pressure in our
cylinders using our gauges. Once the pressure falls to a pre-computed
level, we end the dive and ascend to the surface. How exactly do we
compute this level for an open water dive? In this post we lay out the
ingredients to answer this question, according to a model taught to us
by our scuba mentor [Bob Sherwood][bob]. In our next post we will tie
it all together and actually crank through the calculations. Our
mathematically inclined readers could do the calculations on their
own. Hint: it's a piecewise linear integral.

A quick note: there are as many ways to approach this question as
there are dive training agencies, and there are a
[hell of a lot][agencies] of these.  Surprisingly, we were taught very
little about gas consumption during the many scuba courses we took
before we met Bob. Instead, we relied on unreliable divemasters who
gave vague instructions such as: "start ascending when you have about
800 psi in your tank or the boat will leave you." We have learned in
retrospect that these statements are simply inappropriate for most of
the dives we do. In some cases they are unsafe because they leave too
little gas to support a safe ascent, and in other cases they waste
perfectly good gas and bottom time by being too
conservative. Determining our own gas consumption needs is not a
difficult calculation, so we prefer not to rely on the word of a
stranger.  We now run through these calculations before every single
dive, even if we have been to the site before. (We do the math
independently, and compare our answers as a safety check. We usually
agree, which is good for our marriage).

<!-- more -->

### We speak imperial ###

One of us is technically an EU citizen, but when in New York he does as the
Americans do, and that means expressing volume in cubic feet instead of
liters, pressure in pounds per square inch (psi) instead of bar, and depth in
feet instead of meters.

### Surface air consumption rate###

Our surface air consumption (SAC) rate is about 0.75 cubic feet per minute. In
other words, when we are hanging out normally above water, we consume about
0.75 cubic feet of gas every minute. Surprisingly, we never knew this our
first few years of diving, partially because it was not covered in any of the
three courses we took with our PADI instructors. We consider this a
shortcoming of their curriculum. Divers must know how quickly they are
consuming gas in order to safely plan and execute their dives.

We measured our SAC in four feet of water in a pristine outdoor
swimming pool of the nicest days of the year. In other words, there
was no surge, no current, and no stress. Under normal scuba conditions
which are more challenging than a shallow swimming pool, we generally
use a SAC rate of 1.0 cubic feet per minute in our calculations to
give us a safety margin.

### Ambient pressure ###

Air pressure at sea level is 14.7 psi, which is also called 1 *absolute
atmosphere* or 1 ata. The ambient pressure in water increases by 1
ata for every 33 feet of depth. We add the air pressure to the water pressure,
so diving 33 feet below the surface sums to 2 atas, diving 66 feet below
the surface translates to 3 atas, and so forth.

When we're under water we use [scuba regulators][regs] to deliver the gas we
breathe, which is delivered at the same pressure as the ambient pressure. If
they always delivered gas at 1 ata our diaphragm would not be able to overcome
water pressure below more than a few feet of water. Thus we would not be able
to inhale and scuba would be considerably less fun.

If the ambient pressure is 2 atas, we use twice as much gas with every breath
compared to the surface. This means we consume our gas at twice our SAC rate
when we are at 33 feet.  Similarly, we consumer our gas at three times our SAC
rate when we are at 66 feet below the surface, and so forth.

### Safety stops and ascent rate ###

We have already covered that we consume gas underwater much faster than our
SAC rate. At this point many people start talking about [partial
pressures][partialpressures] of the gases they breathe, but we won't go into
that here because we don't need it for this article. Suffice it to say that we
inhale and absorb a ***lot*** more nitrogen when we are scuba diving than when
we are going about our normal lives above water.

The human body is quick to absorb nitrogen yet slow to offgas it through
breathing. This unfortunate imbalance is the cause of [decompression
sickness][thebends], commonly called **the bends**, when a drop in ambient
pressure causes nitrogen bubbles to form in the body. If you want to have a
graphic idea how horrible this can be, watch [this video][jello] and imagine
that it is ***you*** that's filling with bubbles instead of a block of
gelatin. For yet another insight into the damage that decompression illness
can do, skip to the end of Bernie Chowdury's [fantastic yet tragic
book][rouses] chronicling how two divers died from explosive decompression
after exploring a the famous sunken [German U-boat close to New Jersey][u869].

While it is unlikely that we will experience explosive decompression on our
shallow dives at Dutch Springs, we still impose a strict speed limit when
ascending. Our maximum ascent rate when diving is 30 feet/min at depths below
33 feet, and 10 feet/min at shallow depths between 0 and 33 feet where the
gradient of pressure is greater. Furthermore, when ascending from the bottom
of our dive, we do a series of one-minute safety stops, spaced 10 feet apart
in depth and starting at approximately half our maximum depth. Combined with
adequate surface intervals which we compute from [dive tables][noaa], this
reduces the risk of decompression sickness (although it always remains a
possibility).

<meta property="og:image" content="/assets/images/diveProfile.png" />
<img style="float:left; width: 550px; padding:10px" src="/assets/images/diveProfile.png" alt="Warm and salty!"/>

For example, above is a profile of a dive we did off of Pompano Beach last
year, logged using our Suunto computers and [MacDive][] software. Maximum
depth for this dive was 70 feet, so we took a series of four one- minute
safety stops at 40, 30, 20, and 10 feet, circled in orange on the right, with
four one- minute ascents in between each stop. We took eight minutes total to
ascend from 40 feet to the surface.

### We use aluminum cylinders ###

Although we put steel tanks on our Christmas wish list, we're still
diving with [aluminum 80s][al80], the most popular type of cylinder
for recreational scuba diving. One slightly shitty thing about them is
that, despite their name, they actually only hold 77 cubic feet of air
when filled to their to 3000 psi limit.

### Your buddy needs to breathe ###

We adhere strictly to the dive buddy system.  This means that when we dive, we
keep a close eye on each other in order to assist in the case of an emergency,
such as running out of gas or equipment failure. In terms of our gas
consumption, this means we need to always have enough gas in either of our
cylinders to support a safe ascent for *both* of us, including safety stops.  In
other words, if you figure out how much gas you need from the previous two
sections of this article, *multiply it by two* if you want to ensure your
buddy returns to the surface with you.

[dutchsprings]: http://www.dutchsprings.com
[guefundies]: https://www.globalunderwaterexplorers.org/content/gue-fundamentals
[nitrox]: https://en.wikipedia.org/wiki/Nitrox
[bob]: http://allaboutscuba.com
[agencies]: https://en.wikipedia.org/wiki/List_of_diver_certification_organizations
[partialpressures]: https://en.wikipedia.org/wiki/Partial_pressure
[thebends]: https://en.wikipedia.org/wiki/Decompression_sickness
[jello]: https://www.youtube.com/watch?v=taTh0uBJ4RE#t=54s
[rouses]: http://www.amazon.com/Last-Dive-Father-Descent-Oceans-ebook/dp/B006IDG3X6/ref=sr_1_1?ie=UTF8&qid=1400801315&sr=8-1&keywords=bernie+chowdhury
[u869]: https://en.wikipedia.org/wiki/German_submarine_U-869
[noaa]: http://www.ndc.noaa.gov/pdfs/nitrox32.pdf
[macdive]: http://mac-dive.com
[al80]: http://www.xsscuba.com/tank_cat_alum_specs_.html
[cesa]: https://en.wikipedia.org/wiki/Controlled_Emergency_Swimming_Ascent
[regs]: https://en.wikipedia.org/wiki/Diving_regulator
