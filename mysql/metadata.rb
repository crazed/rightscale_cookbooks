maintainer       "Datapipe"
maintainer_email "afeid@datapipe.com"
license          "All rights reserved"
description      "Installs/Configures mysql"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"
recipe "mysql::default", "Installs mysql-server"
attribute 'mysql/rootpw',
  :display_name => "MySQL Root Password",
  :required => "required"
