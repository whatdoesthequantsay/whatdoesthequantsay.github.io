---
layout: page
title: What does the quant say?
tagline: We are a pair of quantitative analysts living in the heart of downtown Manhattan.
---
{% include JB/setup %}

# Archive #
<ul class="posts">
  {% for post in site.posts %}
    <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>

# Recent Posts #
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

