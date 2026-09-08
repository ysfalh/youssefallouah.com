---
layout: default
title: Publications
permalink: /publications.html
---

{% assign publications = site.data.publications | where_exp: "publication", "publication.category != 'Thesis'" %}
{% assign publication_years = publications | group_by: "year" | sort: "name" | reverse %}
{% for publication_year in publication_years %}
<section class="publication-year-group" aria-labelledby="year-{{ publication_year.name }}">
  <h2 class="publication-year" id="year-{{ publication_year.name }}">{{ publication_year.name }}</h2>
  {% for publication in publication_year.items %}
  {% include publication.html publication=publication %}
  {% endfor %}
</section>
{% endfor %}

{% assign theses = site.data.publications | where: "category", "Thesis" | sort: "year" | reverse %}
{% if theses.size > 0 %}
<section class="publication-year-group" aria-labelledby="thesis">
  <h2 class="publication-year" id="thesis">Doctoral thesis</h2>
  {% for publication in theses %}
  {% include publication.html publication=publication %}
  {% endfor %}
</section>
{% endif %}
