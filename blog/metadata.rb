maintainer       "Datapipe"
maintainer_email "afeid@datapipe.com"
license          "All rights reserved"
description      "Installs/Configures blog"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"
recipe "blog::default", "Downloads and configures a basic blogging platform"
attribute 'blog_type',
  :display_name => "Blog Engine",
  :description => "The blog engine you would like to use",
  :choice => [ 'drupal', 'wordpress' ],
  :type => "string",
  :required => "recommended",
  :recipes => [ 'blog::default' ],
  :default => 'drupal'
