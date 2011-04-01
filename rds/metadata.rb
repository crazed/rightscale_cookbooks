maintainer       "Datapipe"
maintainer_email "cloud@datapipe.com"
license          "All rights reserved"
description      "Configures mysql-client for RDS"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"
recipe 'rds::mysql_client', "Configures MySQL client for use with RDS"
attribute 'rds/user',
  :display_name => 'RDS Username',
  :description => 'The master username for an RDS instance',
  :type => 'string',
  :required => 'required',
  :recipes => [ 'rds::mysql_client' ]
attribute 'rds/password',
  :display_name => 'RDS Password',
  :description => 'The password for your RDS user',
  :type => 'string',
  :required => 'required',
  :recipes => [ 'rds::mysql_client' ]
attribute 'rds/hostname',
  :display_name => 'RDS Hostname',
  :description => 'The RDS endpoint hostname',
  :type => 'string',
  :required => 'required',
  :recipes => [ 'rds::mysql_client' ]
attribute 'rds/new_database',
  :display_name => "New RDS Database",
  :description => "New database to create in an RDS instance",
  :required => 'required',
  :recipes => [ 'rds::new_database' ]
attribute 'rds/new_password',
  :display_name => "New RDS User's Password",
  :description => "The password for a new RDS user",
  :required => 'required',
  :recipes => [ 'rds::new_database' ]
attribute 'rds/new_user',
  :display_name => "New RDS User",
  :description => "Create a new RDS user",
  :required => 'required',
  :recipes => [ 'rds::new_database' ]
