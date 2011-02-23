maintainer       "Datapipe"
maintainer_email "cloud@datapipe.com"
license          "All rights reserved"
description      "Installs/Configures varnish"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"
recipe "varnish::install", "Installs/configures varnish"
attribute 'varnish/port',
  :display_name => "Varnish Port",
  :description => "The port varnish will be listening on",
  :default => "80",
  :recipes => [ 'varnish::install' ]
attribute 'varnish/backend_host',
  :display_name => "Varnish Backend Host",
  :description => "Backend host to connect to",
  :default => "127.0.0.1",
  :recipes => [ 'varnish::install' ]
attribute 'varnish/backend_port',
  :display_name => "Varnish Backend Port",
  :description => "Backend port to connect to ",
  :default => "8080",
  :recipes => [ 'varnish::install' ]
