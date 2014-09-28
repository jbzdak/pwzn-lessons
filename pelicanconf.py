#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

import os, sys
import unipath

DIRNAME = os.path.dirname(__file__)
if not DIRNAME in sys.path:
    sys.path.append(DIRNAME)

THEME = unipath.Path(__file__).parent.child("themes", 'jbtheme')

if not THEME in sys.path:
    sys.path.append(THEME)

import blog_utils

PLUGIN_PATHS = [unipath.Path(DIRNAME, 'pelican-plugins').absolute()]

PLUGINS = ['render_math']


AUTHOR = u'Jacek Bzdak'
SITENAME = u'Python w Zastosowaniach Naukowych'
SITEURL = ''

PATH = 'content'

TIMEZONE = 'Europe/Warsaw'

DEFAULT_LANG = u'pl'

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None

STATIC_PATHS = ['static']

# Social widget
SOCIAL = (('You can add links in your config file', '#'),
          ('Another social link', '#'),)

DEFAULT_PAGINATION = 10


JINJA_EXTENSIONS = [
    'jinja2.ext.with_'
]


JINJA_FILTERS = {
    "tagsort_by_popularity": blog_utils.tagsort_by_popularity,
    "as_dict": blog_utils.as_dict,
    "truncate_words": blog_utils.truncate
}


# Uncomment following line if you want document-relative URLs when developing
#RELATIVE_URLS = True
