# Youssef Allouah

Source for [youssefallouah.com](https://youssefallouah.com), built with Jekyll.

## Local preview

With Ruby and Bundler installed:

```sh
bundle install
bundle exec jekyll serve
```

Open <http://localhost:4000>. To build without starting a server:

```sh
bundle exec jekyll build
```

Generated files go in `_site/`, which is ignored by Git.

## Editing the site

- `index.md`, `publications.md`, `talks.md`, and `blog.md` contain the main pages.
- `_data/publications.yml` supplies the publication lists.
- `_posts/` contains blog posts.
- `_layouts/` and `_includes/` contain the page templates and analytics setup.
- `assets/css/style.scss` contains the styles; `assets/fonts/pagella/` contains the TeX Gyre PagellaX fonts and their license.
- `_config.yml` contains the site settings; `CNAME` sets the custom domain.
