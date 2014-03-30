---
layout: page
title: What does the quant say?
#tagline: Supporting tagline
author: stpyang
---
{% include JB/setup %}

*We are a pair of quantitative analysts living in the heart of
 downtown Manhattan.  We create mathematical models by day and have
 passionately nerdy debates at night.  We also dir dive under water,
 telemark ski below freezing, and one of us runs like a girl all year
 round.*

#Recent Posts#
<div class="post-content-truncate">
{% for post in site.posts limit:10 %}
  {% if post.content contains "<!-- more -->" %}
  <div class="row" style="padding:20px">
	<h3 class="title">{{ post.date | date_to_string }} : {{ post.title }}</h3>
   {{ post.content | split:"<!-- more -->" | first % }}
    <a href="{{ post.url }}">Read more</a>
	</div>
    <hr/>
  {% endif %}
{% endfor %}
</div>

