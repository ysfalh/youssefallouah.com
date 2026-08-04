---
layout: default
title: Publications
permalink: /publications.html
---

<nav class="page-toc" aria-label="Page navigation">
  <span class="toc-label">Publications</span>
  <a href="{{ "/" | relative_url }}">Home</a>
  <a href="{{ "/blog.html" | relative_url }}">Blog</a>
</nav>

## Publications

{% assign publications = site.data.publications | sort: "year" | reverse %}
{% for publication in publications %}
<div class="paper">
  <span class="paper-title">{{ publication.title }}</span>
  {% if publication.links %}<span class="paper-links">{% for link in publication.links %}[<a href="{{ link.url }}">{{ link.label }}</a>]{% unless forloop.last %} {% endunless %}{% endfor %}</span>{% endif %}<br>
  <span class="authors">{{ publication.authors }}</span><br>
  <span class="venue">{{ publication.venue | replace: "Oral", "<strong>Oral</strong>" | replace: "Spotlight", "<strong>Spotlight</strong>" }}</span>
</div>
{% endfor %}
