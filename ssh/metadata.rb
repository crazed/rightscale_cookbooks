maintainer       "Datapipe"
maintainer_email "cloud@datapipe.com"
license          "All rights reserved"
description      "Installs/Configures ssh"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"
recipe 'ssh::keys', 'Configures ssh keys for root access'
attribute 'ssh/authorized_keys',
  :display_name => 'Root Authorized Keys',
  :description => 'The contents of an authorized keys file, will not override EC2 defaults',
  :type => 'string',
  :required => 'required',
  :recipes => [ 'ssh::keys' ]
