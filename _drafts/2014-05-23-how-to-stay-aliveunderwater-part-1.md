---
layout: post
title: "How to stay alive...underwater (part 1)"
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

There are few activities that we enjoy more than scuba diving, but staying
alive is definitely one of them. Thus in order to enjoy our diving we need to
be confident in our safety. There are enough factors which contribute to safe
diving to fill many many volumes and fuel countless heated debates, but in
this post we will focus on air consumption. To be a little pedantic, the two
of us almost never use the term "air" when we dive, since we fill our tanks
with [nitrox][], so for the rest of the post we will use the neutral term
"gas" instead of "air". In this article we introduce the parameters for the
model of gas consumption (for recreational diving) that we learned from our
scuba mentor [Bob Sherwood][bob].

When we dive, we constantly monitor the pressure in our tanks using gauges.
Once the pressure falls to a pre-computed level, we end the dive and ascend to
the surface. How exactly do we compute this level? In this post we introduce
the ingredients to answer this question, and in our next post we will tie it
all together and actually crank through the calculations. Our mathematically
inclined readers could do the calculations on their own. Hint: it's a
piecewise linear integral.

A quick note: there are actually as many ways to answer this question as there
are dive training agencies, and there are a [hell of a lot][agencies] of
these. Surprisingly, we were taught very little about gas consumption during
the many scuba courses we took before we met Bob. Instead, we relied on
unreliable divemasters who generally who gave vague instructions such as:
"start ascending when you have about 800 psi in your tank or the boat will
leave you." We have learned in retrospect that these statements are simply
inappropriate for most of the dives we did. In some cases they are unsafe
because they leave too little gas in the tank for a safe ascent, and in other
cases they waste perfectly good gas and bottom time by being too conservative.
Determining our own gas consumption needs is not a difficult calculation, so
we prefer not to rely on the word of a stranger.  We now run through these
calculations before ***every*** dive we do. (We do them independently, and
compare our answers as a safety check. We usually agree, which is good for our
marriage).

<!-- more -->

### We speak imperial ###

One of us is technically an EU citizen, but when in New York do as the
Americans do, and that means expressing volume in cubic feet, pressure in
pounds per square inch (psi), and depth in feet.

### Surface air consumption rate###

Our Surface air consumption (SAC) rate is about 0.75 cubic feet per minute. In
other words, when we are hanging out normally above water, we consume about
0.75 cubic feet of gas every minute. Surprisingly, we never knew this our
first few years of diving, partially because it was not covered in any of the
three courses we took with PADI. We consider this a shortcoming of their
curriculum. Divers must know how quickly they are consuming gas in order to
safely plan and execute their dives.

We measured our SAC in four feet of water in a pristine swimming pool of the
nicest days of the year. In other words, there was no surf, no currents, and
no stress. Under normal scuba conditions which are more challenging than a
swimming pool, we generally use twice our SAC rate to give us a safety margin.

### Ambient pressure ###

Air pressure at sea level is 14.7 psi, which is also called 1 *absolute
atmosphere* or 1 ata. The ambient pressure in water pressure increases by 1
ata for every 33 feet of depth. We add the air pressure to the water pressure,
so diving 33 feet below the surface sums to 2 atas of pressure, diving 66 feet
below the surface translates to 3 atas of pressure, and so forth.

When we're under water we use [scuba regulators][regs] to deliver our
breathing gas. This gas is delivered at the same pressure as ambient pressure.
If they always delivered gas at 1 ata our diaphragm would not be able to
overcome water pressure below more than a few feet of water. Thus we would not
be able to breathe, so scuba would have a mortality rate of near 100% and be
considerably less popular. Since the ambient pressure at 33 feet is twice that
at sea level we will use twice as much gas with every breath. This means we
consume our gas at twice our SAC rate when we are at 33 feet, at three times
our SAC rate when we are at 66 feet below the surface, and so forth.

### Safety stops and ascent rate ###

We have already covered that we consume gas underwater much faster than our
SAC rate. At this point many people start talking about [partial
pressures][partialpressures] of the gases they breathe, but we won't go into
that here because we don't need it for this article. Suffice it to say that we
inhale and absorb a ***lot*** more nitrogen when we are scuba diving than when
we are breathing going about our normal lives above water.

The human body is quick to absorb nitrogen yet slow to offgas it through
breathing. This unfortunate imbalance is the cause of [decompression
sickness][thebends], commonly called **the bends**, when a drop in ambient
pressure causes bubbles to form in the body. If you want to have a graphic
idea how horrible this can be, watch [this video][jello] and imagine that it
is ***you*** that's filling with bubbles instead of a block of gelatin. For
yet another insight into the damage that decompression illness can do, skip to
the end of Bernie Chowdury's [fantastic yet tragic book][rouses] chronicling
how two of his friends died from explosive decompression after exploring a the
famous sunken [German U-boat close to New Jersey][u869].

While it is unlikely that we will experience explosive decompression on our
shallow dives at Dutch Springs, we still must take care in our ascents. Our
maximum ascent rate when diving is 30 feet/min at depths below 33 feet, and 10
feet/min at shallow depths between 0 and 33 feet. Furthermore, when ascending
from the bottom of our dive, we do a series of one-minute *safety stops*,
spaced 10 feet apart and generally starting at half our maximum depth.

<meta property="og:image" content="/assets/images/diveProfile.png" />
<img style="float:left; width: 550px; padding:10px" src="/assets/images/diveProfile.png" alt="Warm and salty!"/>

For example, above is a profile of a dive we did off of Pompano Beach last
year, logged using our Suunto computers coupled with [MacDive][] software.
Maximum depth for this dive was 70 feet, so we took a series of four one-
minute safety stops at 40, 30, 20, and 10 feet, circled in orange, with four
one-minute ascents in between each stop.

### We use aluminum tanks ###

Although we put steel tanks on our Christmas wish list, we dive with [80 cubic
foot aluminum tanks][al80] this year. This is a very popular type of tank that
scuba divers use. One slightly shitty thing about them is that, despite their
name, they actually only hold 72 cubic feet of air.  We generally fill them to
3000 psi, which is the official limit, though sometimes we go a hundred or two
psi over, especially if the weather is warm.  By the way, the 3000 psi limit
is considered very conservative --- all scuba tanks are regularly
hydrostatically tested up to 5000 psi.

### Your buddy needs to breathe ###

We adhere strictly to the dive buddy system.  This means that when we dive, we
keep a close eye on each other in order to assist in the case of an emergency,
such as running out of gas or equipment failure. In terms of our gas
consumption model, this means we need to always have enough gas in either of
our tanks to support a safe ascent for both of us, safety stops included.  In
other words, if you figure out how much gas you need from the previous two
sections of this article, *multiply it by two* if you want your buddy to live.
A buddy running low of gas is not a good reason to [CESA][].  We still take
safety stops and adhere to the speed limit even while sharing air.

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
[macdive]: http://mac-dive.com
[al80]: http://www.xsscuba.com/tank_cat_alum_specs_.html
[cesa]: https://en.wikipedia.org/wiki/Controlled_Emergency_Swimming_Ascent
[regs]: https://en.wikipedia.org/wiki/Diving_regulator
