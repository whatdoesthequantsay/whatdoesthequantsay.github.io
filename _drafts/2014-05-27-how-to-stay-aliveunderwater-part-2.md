---
layout: post
title: "How to stay alive...underwater (part 2)"
description: ""
author: christian
tags: []
category: 
---
{% include JB/setup %}

In our [previous post] we laid out the ingredients for the gas consumption
model which we use when we are scuba diving.  In this post we crank through a
bit of mathematics ...


### Depth Consumption Rate (DCR) ###

$$ DCR = SAC * (1 + \mathrm(depth) / 33) $$

### Ascent rate approximation ###

{can do more complicated piecewise lienar integration, but we approximate}

Ascent rate = 30 ft/min until max(depth / 2, 30)

5 ft/min from max(dephth/2, 30) to 0

### Integration ###

### Table of values ###