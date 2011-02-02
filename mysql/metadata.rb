maintainer       "Datapipe"
maintainer_email "afeid@datapipe.com"
license          "All rights reserved"
description      "Installs/Configures mysql"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"
recipe "mysql::default", "Installs mysql-server"
recipe "mysql::new_database", "Configures a new database"
attribute 'mysql/rootpw',
  :display_name => "MySQL Root Password",
  :required => "required",
  :recipes => [ 'mysql::default' ]
attribute 'mysql/user',
  :display_name => 'MySQL User',
  :description => 'A regular mysql user, used typically for application level database access.',
  :default => 'user',
  :recipes => [ 'mysql::new_database' ]
attribute 'mysql/password',
  :display_name => 'MySQL User Password',
  :description => 'The password for a regular MySQL user.',
  :required => 'required',
  :recipes => [ 'mysql::new_database' ]
