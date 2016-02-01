---
layout: page
title: "People"
date: 2016-01-06 12:20
navbar: About
subnavbar: People
---

<table id="people-db" class="table table-striped">
<thead class="thead-default">
  <tr>
    <th>Name</th>
    <th>Affiliation</th>
    <th>Email</th>
    <th>Homepage</th>
  </tr>
</thead>
<tbody>
{% for person_hash in site.data.people %}
  {% assign person = person_hash[1] %}
  <tr>
    <td><strong>{{ person.sur_name }}</strong>, {{ person.given_name }}</td>
    <td>{{ site.data.orgs[person.affiliation].title }}</td>
    <td>
      {% if person.email %}
        {% assign email = person.email | obfuscate_email %}
        <a target="_blank"
           class="email-obfuscated"
           title="write an email to {{ person.given_name }} {{ person.sur_name }}"
           data-email="{{ email }}">
          {{ email }}
        </a>
      {% endif %}
    </td>
    <td>
      {% if person.homepage %}
        <a href="{{ person.homepage }}"
           target="_blank"
           title="{{ person.homepage }}">
          <i class="fa fa-home fa-fw"></i>
        </a>
      {% endif %}
    </td>
  </tr>
{% endfor %}
  </tbody>
</table>