---
layout: basic
title: "Imprint"
permalink: /imprint/
date: 2014-09-04 11:17
updated: 2015-06-10 11:00:00 +0200
---
Design and implementation by [Torbjörn Klatt](https://github.com/torbjoernk).
Contributions made by the following list of awesome people:
<ul>
{% for author in site.git.authors %}
  <li>{{ author.name }} ({{ author.commits }} commit{% if author.commits > 1 %}s{% endif %})</li>
{% endfor %}
</ul>
This website is build with the following open source tools and libraries:


* [Jekyll](https://jekyllrb.com/) with the following plugins
  - [jekyll-assets](https://github.com/jekyll/jekyll-assets)
  - [jekyll-scholar](https://github.com/inukshuk/jekyll-scholar)
  - [jekyll-sitemap](https://github.com/jekyll/jekyll-sitemap)
  - [jekyll-feed](https://github.com/jekyll/jekyll-feed)
  - [jekyll-paginate](https://github.com/jekyll/jekyll-paginate)


* [jQuery 2.1.4](http://jquery.com/)


* [Twitter Bootstrap v4-dev](https://v4-alpha.getbootstrap.com)
  _(at some commit between alpha.2 and alpha.3)_
  - which depends on [Tether.js](http://tether.io/docs/welcome/) for tooltips


* minimal adjusted [DataTables.js](https://datatables.net/) to work with _Bootstrap v4-dev_
  - with [datetime plugin](https://datatables.net/blog/2014-12-18)
    - which depends on [moment.js](http://momentjs.com/)


* [Featherlight.js](https://noelboss.github.io/featherlight/) for lightbox effects (e.g. on some images)


* theme based on [*Cosmo* Bootswatch](https://bootswatch.com/cosmo/)


* special fonts
  - [font-awesome](https://fortawesome.github.io/Font-Awesome/) for icons
  - [Roboto Font Family](https://github.com/google/roboto)


* deployment via [Travis CI][travis], [GitHub Pages][ghpages] and [jgd gem][jgd]
[travis]: https://travis-ci.org
[ghpages]: https://pages.github.com
[jgd]: https://github.com/yegor256/jekyll-github-deploy
