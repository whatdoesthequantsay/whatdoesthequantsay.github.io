---
layout: post
title: "How to stay alive...underwater (Part 2)"
description: ""
author: christian
tags: []
category: 
---
{% include JB/setup %}

## Introduction ##

As a follow-up to our [previous post][part1] we will now work through
the minimum gas calculations we discussed. The specific worst-case
scenario that we must be able to handle is this following: One of us
is cut off from our gas when we are at the deepest part of the
dive. If this happens then we need enough gas in the remaning buddy's
tank to support a safe ascent including all safety stops.

Let us quickly review how we do our safety stops for dives up to 100
feet deep. In this case we perform what's known as "minimum deco",
with the ascent as follows: If the maximum depth of our dive is $$d$$,
we first ascend to depth $$\mathrm{max}(d/2, 30)$$ with an ascent rate
of 30 ft/min. At depth $$\mathrm{max}(d/2, 30)$$ we do a 30 second
stop, then ascend 10 ft in 30 seconds, then do another 30 second stop,
ascent 10 ft in 30 seconds etc until we reach the surface.  Dives
deeper than 100 feet require a different algorithm and different
considerations, but that's a topic for a different blog post.

## Calculation: between 60 and 100 feet ##

In order to simplify our calculation we will approximate a 30 second
safety stop at depth $$x$$ followed by a 30 second ascent to $$x-10$$
by a 60 second ascent from $$x$$ to $$x-10$$. In other words, we
assume a 10 ft/min constant ascent rate.

Also note that the pressure $$p(x)$$ at a depth $$x$$ in ATA can be
computed as $$p(x) = (1 + x/D)$$, where $$D$$ is the depth at which
the pressure doubles, i.e. $$D = 33$$ if our unit is ft. The gas
consumption at a depth $$x$$ is $$s\cdot p(x)$$ where $$s$$ is the SAC rate.

When ascending a small distance $$\Delta x$$ with an ascent rate $$v$$
the amount of gas consumed during this small ascent can be calculated
as $$s\cdot p(x) \Delta x / v$$. The amount of gas consumed when
ascending from a depth $$d$$ can thus be computed as the sum of two
integrals

$$ 
\int_{d/2}^{d} \frac{s\cdot p(x)}{v_1} dx + \int_{0}^{d/2} \frac{s\cdot p(x)}{v_2} dx 
$$ 

where $$v_1$$ is the ascent rate from $$d$$ to $$d/2$$ and $$v_2$$ is
the ascent rate from $$d/2$$ to the surface. For us, $$v_1$$ is 30
ft/min and $$v_2$$ is 10 ft/min.

We are almost to our answer.  However, we need to add one more thing.
Given an out of air emergency, we need a small amount of time $$t$$
(normally about one minute) in order to communicate with each other
and begin the process of air sharing. During this time interval at the
deepest part of the dive the gas consumed is $$s \cdot p(d) \cdot
t$$. With this additional time built into the model, the total amount
of gas we use is:

$$
\begin{align}
g(d) 
&= s \cdot p(d) \cdot t+  \int_{d/2}^{d} \frac{s\cdot p(x)}{v_1} dx + \int_{0}^{d/2} \frac{s\cdot p(x)}{v_2} dx \\
&= s \cdot p(d) \cdot t +  \frac{s}{v_1} \int_{d/2}^{d} \left( 1 + \frac{x}{D} \right) dx 
+ \frac{s}{v_2} \int_{0}^{d/2} \left( 1 + \frac{x}{D} \right)dx \\
%&= s \cdot t\left(1 + \frac{d}{D} \right) +  \frac{s}{v_1} \left( \frac{d}{2} + \left[ \frac{x^2}{2 D} \right]_{d/2}^{d} \right) 
%+ \frac{s}{v_2} \left( \frac{d}{2} + \left[ \frac{x^2}{2 D} \right]_{0}^{d/2} \right) \\
&= s \cdot t\left( 1 + \frac{d}{D} \right) +  \frac{s}{v_1} \left( \frac{d}{2} + \frac{ 3 d^2}{8 D} \right) 
+ \frac{s}{v_2} \left( \frac{d}{2} + \frac{d^2}{8 D} \right) \\
&= s \cdot t + \frac{s}{2} \left( \frac{1}{v_1} + \frac{1}{v_2} + \frac{2t}{D} \right) d 
+ \frac{s}{8 D} \left( \frac{3}{v_1} + \frac{1}{v_2} \right) d^2. 
\end{align}
 $$

We see that the consumed gas $$g(d)$$ can be expressed as a quadratic
polynomial:

$$
g(d) = A + Bd + Cd^2.
$$

where the coefficients are

$$
\begin{align}
A &= s \cdot t\\
B &= \frac{s}{2} \left( \frac{1}{v_1} + \frac{1}{v_2} + \frac{2t}{D}\right), \\
C &= \frac{s}{8 D} \left( \frac{3}{v_1} + \frac{1}{v_2} \right).
\end{align}
$$

Now we just plug in the numerical values for $$D$$, $$v_1$$, $$v_2$$,
$$t$$ and $$s$$. In our previous post we determined our SAC rate to be
1.0 cubic feet per minute, but since we are two people breathing we
double this to 2.0 cubic feet per minute. The numerical values are
then

$$
\begin{align}
D &= 33\mathrm{\ feet}\\
v_1 &= 30\mathrm{\ feet/min}\\
v_2 &= 10\mathrm{\ feet/min}\\
t &= 1\mathrm{\ min}\\
s &= 2\mathrm{\ cubic\ feet/min}
\end{align}
$$

Plugging in these values we obtain

$$  
\begin{align} 
A &= \left(
	\frac{2 \mathrm{\ feet}^3}{\mathrm{min}}
\right) \cdot \left(1\mathrm{\ min}\right)
= 2\mathrm{\  feet}^3\\
B &= \left(2\frac{\mathrm{\ feet}^3}{\mathrm{min}}\right)\cdot
	\left(
		\frac{1\mathrm{\ min}}{30\mathrm{\ feet}}
		+ \frac{1\mathrm{\ min}}{10\mathrm{\ feet}}
		+ \frac{2\mathrm{\ min}}{33\mathrm{\ feet}}
	\right)
= \frac{32}{165}\mathrm{\ feet}^2 \approx 0.194\mathrm{\ feet}^2 \\ 
C &= \frac{2\mathrm{\ feet}^3}{8 \cdot 33\mathrm{\ min\ feet}} \left(
	\frac{3\mathrm{\ min}}{30\mathrm{\ feet}}
	+ \frac{1\mathrm{\ min}}{10\mathrm{\ feet}} \right)
	= \frac{1}{660}\mathrm{\ feet} \approx 0.00151 \mathrm{\ feet}
\end{align} 
$$
 
Note that $$A$$ has units of cubic feet, $$B$$ has units of square
feet, $$C$$ has units of feet, so that $g(d)$ has units of cubic feet,
which is exactly what we expect!

We now convert cubic feet to tank pressure. By the
[ideal gas law][gaslaw] the gas amount is directly proportional to the
pressure in the tank. A standard aluminum tank will contain around 75
cubic feet of gas at 3000 psi. Therefore the amount $$g(d)$$
corresponds to a tank pressure of

$$
g(d)*3000/75 = 40 g(d).
$$

Finally then we have the following formula for the minimum tank
pressure $$m(d)$$ that we need to safely ascend:

$$
m(d) = 40 g(d) = 40 \left( 2 + \frac{32}{165} d
+ \frac{1}{660} d^2 \right) = 80 + \frac{256}{33} d + \frac{2}{33} d^2.
$$


## Calculation: 30 to 60 feet ##

The calculation is similar to the one above, except that we begin our
safety stops at $$u = 30$$ feet instead of $$d/2$$ feet.
Thus the integral becomes

$$ 
\begin{align}
g(d) 
&= s \cdot p(d) \cdot t+  \int_{u}^{d} \frac{s\cdot p(x)}{v_1} dx + \int_{0}^{u} \frac{s\cdot p(x)}{v_2} dx \\
&= s \cdot p(d) \cdot t +  \frac{s}{v_1} \int_{u}^{d} \left( 1 + \frac{x}{D} \right) dx 
+ \frac{s}{v_2} \int_{0}^{u} \left( 1 + \frac{x}{D} \right)dx \\
%&= s \cdot t\left(1 + \frac{d}{D} \right) +  \frac{s}{v_1} \left(d - u + \left[ \frac{x^2}{2 D} \right]_{u}^{d} \right)
%+ \frac{s}{v_2} \left( u + \left[ \frac{x^2}{2 D} \right]_{0}^{u} \right) \\
&= s \cdot t\left( 1 + \frac{d}{D} \right) +  \frac{s}{v_1} \left(d - u + \frac{d^2 - u^2}{2 D} \right) 
+ \frac{s}{v_2} \left(u + \frac{u^2}{2D} \right) \\
&= s \cdot \left(t - \frac{u}{v_1} -\frac{u^2}{2Dv_1} +\frac{u}{v_2} +
\frac{u^2}{2Dv_2}\right) + s\left( \frac{1}{v_1} + \frac{t}{D} \right) d 
+ \left( \frac{s}{2Dv_1}\right) d^2. 
\end{align}
$$ 

and our values for $$A$$, $$B$$, and $$C$$ become:

$$ 
\begin{align}
A &= \frac{86}{11} \approx 7.82 \mathrm{\ feet}^3\\
B &= \frac{7}{55} \approx 0.127\mathrm{\ feet}^2\\
C &= \frac{1}{990} \approx 0.00101 \mathrm{\ feet}
\end{align}
$$ 

Note that when $$d = 60$$, this gives us $$19.09$$ cubic feet or
$$763.6$$ psi, which is exactly the same as the previous formula for $$d
= 60$$.

## Calculation: less than 30 feet ##

Diving at less than 30 feet we will approximate our ascent by going
directly to the surface at 10 ft per minute. Our integral then
becomes:

$$ 
\begin{align} 
g(d) 
&= s \cdot p(d) \cdot t+ \int_{0}^{d} \frac{s\cdot p(x)}{v_2} dx \\
&= s \cdot p(d) \cdot t + \frac{s}{v_2} \int_{0}^{d} \left( 1 + \frac{x}{D} \right)dx \\
&= s \cdot t\left(1 + \frac{d}{D} \right) + \frac{s}{v_2} \left(d + \frac{d^2}{2 D}  \right) \\
&= s\cdot t + s\left(\frac{t}{D} + \frac{1}{v_2}\right)d + s\left(\frac{1}{2Dv_2}\right)d^2
\end{align}
$$

and our values for $$A$$, $$B$$, and $$C$$ become:

$$ 
\begin{align}
A &= 2 \mathrm{\ feet}^3\\
B &= \frac{43}{165} \approx 0.261\mathrm{\ feet}^2\\
C &= \frac{1}{330} \approx 0.00303 \mathrm{\ feet}
\end{align}
$$ 

Plugging in the value $$d = 30$$ gives us $$12.55\mathrm{\ feet}^3$$ or
$$501.8$$ psi, which matches our second formula.

## Summary ##

To summarize we compute the minimum gas requirements for various
depths here

|Depth | Minimum psi for a 80 cubic foot aluminum tank|
|-|-|
|20 | 337|
|40 | 581|
|60 | 764 |
|80 | 1088|
|100 | 1462|


[part1]: http://whatdoesthequantsay.com/2014/05/23/how-to-stay-aliveunderwater-part-1/
[gaslaw]: https://en.wikipedia.org/wiki/Ideal_gas_law
