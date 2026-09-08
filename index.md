---
layout: default
title: Youssef Allouah
home: true
---

## Recent Publications

<p class="note">See the <a href="{{ "/publications.html" | relative_url }}">publications</a> page for the complete list.</p>

{% assign recent_publications = site.data.publications | where: "recent", true %}
{% for publication in recent_publications %}
{% include publication.html publication=publication %}
{% endfor %}
