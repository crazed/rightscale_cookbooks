maintainer       "Datapipe"
maintainer_email "cloud@datapipe.com"
license          "All rights reserved"
description      "Installs/Configures monitoring"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"
recipe 'monitor::collectd', 'Installs and cnofigures collectd'
attribute 'rs/sketchy_server',
  :display_name => 'Sketchy Server',
  :desciption => 'The RightScale sketchy server hostname',
  :required => 'required'
attribute 'rs/server_uuid',
  :display_name => 'Server UUID',
  :description => 'The RightScale UUID for a server',
  :required => 'required'
