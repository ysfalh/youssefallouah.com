---
layout: default
title: Blog
permalink: /blog.html
---

{% for post in site.posts %}
<div class="blog-entry">
  <p class="blog-date">{{ post.date | date: "%B %-d, %Y" }}</p>
  <h2><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h2>
  <p>{{ post.excerpt | strip_html | truncate: 240 }}</p>
</div>
{% endfor %}
