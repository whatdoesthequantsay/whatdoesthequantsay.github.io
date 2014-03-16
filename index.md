---
layout: page
title: What does the quant say?
#tagline: Supporting tagline
author: stpyang
---
{% include JB/setup %}

We are a pair of quantitative analysts living in the heart of downtown Manhattan.
    
## Sample Posts

<ul class="posts">
  {% for post in site.posts %}
    <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>




