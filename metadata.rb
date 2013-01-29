name             "uwsgi"
maintainer       "Damon Jablons"
maintainer_email "damonjablons@gmail.com"
license          "Apache 2.0"
description      "Installs uWSGI, with a LWRP for config files"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

recipe "uwsgi", "Installs uWSGI and dependencies with pip, calls upstart"
recipe "uwsgi::upstart", "Creates an upstart script for uWSGI"

supports "ubuntu"

depends "python"
