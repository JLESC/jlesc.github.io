---
layout: page
title: "Visits"
navbar: "Research"
date: 2016-01-06 12:20
navbar: Research
subnavbar: Visits
---

<div class="table-responsive">
  <table id="visits-db" class="table table-striped">
    <thead class="thead-default">
      <tr>
        <th class="col-visitor">Visitor</th>
        <th class="col-host">Host</th>
        <th class="col-start">From</th>
        <th class="col-end">To</th>
      </tr>
    </thead>
    <tbody>
      {% for visit in site.data.visits %}
        <tr>
          <td class="col-visitor">{% person_inverse {{ visit.from }} %}</td>
          <td class="col-host">{% person_inverse {{ visit.to }} %}</td>
          <td class="col-start">
            <time datetime="{{ visit.start | date_to_rfc822 }}">{{ visit.start | date_to_string }}</time>
          </td>
          <td class="col-end">
            <time datetime="{{ visit.end | date_to_rfc822 }}">{{ visit.end | date_to_string }}</time>
          </td>
        </tr>
      {% endfor %}
    </tbody>
  </table>
</div>
