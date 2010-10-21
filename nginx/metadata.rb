maintainer       "Datapipe"
maintainer_email "afeid@datapipe.com"
license          "All rights reserved"
description      "Installs/Configures nginx-web-stack"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"
recipe "nginx::default", "Installs and configured nginx"
attribute 'domain_name',
  :display_name => "Domain",
  :description => "The FQDN of your website",
  :type => "string",
  :required => "required",
  :recipes => [ "nginx::default" ]
