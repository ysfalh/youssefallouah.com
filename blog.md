---
layout: default
title: Blog
permalink: /blog.html
---

<nav class="page-toc" aria-label="Page navigation">
  <span class="toc-label">Blog</span>
  <a href="{{ "/" | relative_url }}">Home</a>
  <a href="{{ "/publications.html" | relative_url }}">Publications</a>
</nav>

## Blog

{% for post in site.posts %}
<div class="blog-entry">
  <p class="blog-date">{{ post.date | date: "%B %-d, %Y" }}</p>
  <h3><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h3>
  <p>{{ post.excerpt | strip_html | truncate: 240 }}</p>
</div>
{% endfor %}
