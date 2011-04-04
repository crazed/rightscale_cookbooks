maintainer       "Datapipe"
maintainer_email "cloud@datapipe.com"
license          "All rights reserved"
description      "Installs/Configures wordpress"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"
recipe "wordpress::single_site_rds", "Installs a single site wordpress with RDS database"
attribute 'rds/new_database',
  :display_name => "New RDS Database",
  :description => "New database to create in an RDS instance",
  :required => 'required',
  :recipes => [ 'wordpress::single_site_rds' ]
attribute 'rds/new_password',
  :display_name => "New RDS User's Password",
  :description => "The password for a new RDS user",
  :required => 'required',
  :recipes => [ 'wordpress::single_site_rds' ]
attribute 'rds/new_user',
  :display_name => "New RDS User",
  :description => "Create a new RDS user",
  :required => 'required',
  :recipes => [ 'wordpress::single_site_rds' ]
attribute 'rds/user',
  :display_name => 'RDS Username',
  :description => 'The master username for an RDS instance',
  :type => 'string',
  :required => 'required',
  :recipes => [ 'wordpress::single_site_rds' ]
