maintainer       "YOUR_COMPANY_NAME"
maintainer_email "YOUR_EMAIL"
license          "All rights reserved"
description      "Installs/Configures chef-bootstrap"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"
recipe "chef-bootstrap::default", "sets instance up to be bootstrapped via a chef-server"
attribute "validation_pem",
  :display_name => "Validation Certificate",
  :description => "validation certificate for use with a chef-server",
  :type => "string",
  :required => "required",
  :recipes => [ 'chef-bootstrap::default' ]
attribute "boot_run_list",
  :display_name => "Bootstrap Run List",
  :description => "comma separated run_list to initially bootstrap a client",
  :type => "string",
  :required => "required",
  :recipes => [ 'chef-bootstrap::default' ]
attribute "chef_server",
  :display_name => "Chef Server URL",
  :description => "the url of your chef-server",
  :type => "string",
  :required => "required",
  :recipes => [ 'chef-bootstrap::default' ]
