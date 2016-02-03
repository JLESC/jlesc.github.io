---
layout: page
title: "People"
date: 2016-01-06 12:20
navbar: About
subnavbar: People
---

<p class="lead">
  This is a list of people participating in the JLESC program.
  In case you are part of JLESC and not yet listed here, feel free to add yourself through a
  <a href="https://github.com/JLESC/jlesc.github.io/wiki/Adding-Modifying-Content#people"
     target="_blank">
    pull request on GitHub
  </a>.
</p>

<div class="table-responsive">
  <table id="people-db" class="table table-striped">
    <thead class="thead-default">
      <tr>
        <th class="col-name">Name</th>
        <th class="col-affiliation">Affiliation</th>
        <th class="col-position">Position</th>
        <th class="col-topics">Topics</th>
      </tr>
    </thead>
    <tbody>
    {% for person_hash in site.data.people %}
      {% assign person = person_hash[1] %}
      <tr>
        <td class="col-name">
          <strong>{{ person.sur_name }}</strong>, {{ person.given_name }}
          <div class="btn-group btn-group-sm pull-right" role="group">
            {% if person.email %}
              {% assign email = person.email | obfuscate_email %}
              <a target="_blank"
                 class="btn btn-link btn-sm email-obfuscated"
                 title="write an email to {{ person.given_name }} {{ person.sur_name }}"
                 data-email="{{ email }}"
                 role="button">
                <i class="fa fa-envelope fa-fw"></i>
              </a>
            {% endif %}
            {% if person.homepage %}
              <a href="{{ person.homepage }}"
                 target="_blank"
                 title="{{ person.homepage }}"
                 class="btn btn-link btn-sm"
                 role="button">
                <i class="fa fa-home fa-fw"></i>
              </a>
            {% endif %}
          </div>
        </td>
        <td class="col-affiliation">
          {% for affi in person.affiliation %}
            <abbr title="{{ site.data.orgs[affi].title }}" class="initialism">
              {{ site.data.orgs[affi].abbr }}
            </abbr>
            {% unless forloop.last %}
              ,
            {% endunless %}
          {% endfor %}
        </td>
        <td class="col-position">{{ person.position }}</td>
        <td class="col-topics">{{ person.topics }}</td>
      </tr>
    {% endfor %}
    </tbody>
  </table>
</div>
