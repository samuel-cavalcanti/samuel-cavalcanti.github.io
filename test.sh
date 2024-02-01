#!/bin/bash
#
#
#
rm -rf _site
JEKYLL_ENV=production bundle exec jekyll b -d _site/;

bundle exec htmlproofer _site --disable-external=true --ignore-urls "http://127.0.0.1, http://0.0.0.0, http://localhost"
