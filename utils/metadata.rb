maintainer       "Datapipe"
maintainer_email "cloud@datapipe.com"
license          "All rights reserved"
description      "Installs/Configures utils"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"
recipe 'utils::set_hostname', 'Sets the instance hostname to something sane'
attribute 'utils/hostname',
  :display_name => 'Instance Hostname',
  :description => 'Choose a sane hostname for this instance',
  :type => 'string',
  :recipes => [ 'utils::set_hostname' ]
