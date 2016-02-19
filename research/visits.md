---
layout: page
title: "Visits"
navbar: "Research"
date: 2016-01-06 12:20
navbar: Research
subnavbar: Visits
---

<p class="lead">
  This is a list of visits members of the JLESC program made within JLESC.
  In case your latest visit to your colleague at another JLESC partner is not yet listed here, feel
  free to add yourself through a
  <a href="https://github.com/JLESC/jlesc.github.io/wiki/Editing-Data#editing-visits"
     target="_blank">
    pull request on GitHub
  </a>.
</p>

<div class="table-responsive">
  <table id="visits-db" class="table table-striped">
    <thead class="thead-default">
      <tr>
        <th class="col-visitor">Visitor</th>
        <th class="col-host">Host</th>
        <th class="col-start">From</th>
        <th class="col-end">To</th>
        <th class="col-pm"><abbr title="Person-Months">PM</abbr></th>
      </tr>
    </thead>
    <tbody>
      {% for visit in site.data.visits %}
        {% assign visit_start_stamp = visit.start | date:"%s" %}
        {% assign visit_duration = visit.end | date:"%s" | minus:visit_start_stamp %}
        <tr>
          <td class="col-visitor">{% person_inverse {{ visit.from }} %}</td>
          <td class="col-host">{% person_inverse {{ visit.to }} %}</td>
          <td class="col-start">
            {{ visit.start | date_to_string }}
          </td>
          <td class="col-end">
            {{ visit.end | date_to_string }}
          </td>
          <td class="col-pm">
            <abbr title="{% duration_humanized {{ visit_duration }} %}">
              {% duration_pms {{ visit_duration }} %}
            </abbr>
          </td>
        </tr>
      {% endfor %}
    </tbody>
  </table>
</div>

<p class="text-muted">
  The amount of <em>Person-Months</em> is computed from the start and end date of each visit with
  the assumption of 30 days per month.
</p>
