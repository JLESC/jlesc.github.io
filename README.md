# Jekyll Advance Pro Theme

Jekyll Advance is a premium, multi-purpose Jekyll theme. It has 5 content-types for archetypical SMB and marketing websites. A modern semi-flat visual design with customisable hero images and full-width sections.

[Live Demo](https://jekyll-advance.netlify.app/) |
[Live Docs](https://www.zerostatic.io/docs/jekyll-advance/v2.0/)

![Jekyll Advance Theme screenshot](https://www.zerostatic.io/theme/jekyll-advance/jekyll-advance-screenshot.png)

## Installing Jekll

Make sure you have Ruby & Jekyll installed - For a step-by-step guide, read Jekyll docs [installation](https://jekyllrb.com/docs/installation/)

## Install Theme

Extract the theme .zip file to your local computer. Navigate to the project root (it contains the README.md)

Run `bundle install` to install gems.

Then run `jekyll serve` or `bundle exec jekyll serve` to start the Jekyll server.

To build the Jekyll site run `bundle exec jekyll build`

## Deploy

### Netlify

This theme is pre-configured to setup using Netlify's default settings for Jekyll.

If you experience bundle install issues during the Netlify deployment, deleting the Gemfile.lock can sometimes help.

### Github pages

Jekyll Advance Pro is tested to work on Github pages.

#### Configure Github Pages

Github has a great guide on how to setup github pages - https://pages.github.com/

#### Update baseurl

If you are creating a Github pages "Project site" then your site will be in a sub-folder ie `http://username.github.io/repository`

You will need to update the `baseurl` in the `_config.yml` for the asset paths to work correctly.

```
# _config.yml
baseurl: '/jekyll-advance-pro' # This should be the name of your repo!
```

## Credits

This theme uses open-source libraries and assets.

### Font Awesome 5 Free

- **Project:** https://fontawesome.com/
- **License:** https://fontawesome.com/license/free

### Demo content Images by Unsplash

- **Unsplash** https://unsplash.com/
- **License** https://unsplash.com/license
