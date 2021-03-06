maintainer       "Datapipe"
maintainer_email "afeid@datapipe.com"
license          "All rights reserved"
description      "Installs/Configures blog"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"
recipe "blog::default", "Downloads and configures a basic blogging platform"
attribute 'blog/engine',
  :display_name => "Blog Engine",
  :description => "The blog engine you would like to use",
  :choice => [ 'drupal', 'wordpress' ],
  :type => "string",
  :required => "recommended",
  :recipes => [ 'blog::default' ],
  :default => 'drupal'
attribute 'www/document_root',
  :display_name => "Document Root",
  :type => "string",
  :required => "required",
  :recipes => [ "blog::default" ]
attribute 'domain_name',
  :display_name => "Domain",
  :type => "string",
  :required => "required",
  :recipes => [ 'blog::default' ]
attribute 'blog/mysql_user',
  :display_name => "MySQL User",
  :description => "MySQL User to create",
  :type => "string",
  :recipes => [ 'blog::default' ],
  :default => 'blog'
attribute 'blog/mysql_pass',
  :display_name => "MySQL Password",
  :description => "MySQL password to use",
  :type => "string",
  :recipes => [ 'blog::default' ],
  :default => 'blog'
attribute 'blog/database',
  :display_name => "MySQL Database",
  :description => "Database to create",
  :type => "string",
  :recipes => [ 'blog::default' ],
  :default => "blog"
