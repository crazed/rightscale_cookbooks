maintainer       "Datapipe"
maintainer_email "cloud@datapipe.com"
license          "All rights reserved"
description      "Provides operational scripts for code deployments"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"
recipe 'deploy::svn', 'script to deploy code via SVN'
attribute 'deploy/repository',
  :display_name => 'SVN Repository',
  :description => 'The URI to your SVN repository',
  :type => 'string',
  :recipes => [ 'deploy::svn' ],
  :required => 'required'
attribute 'deploy/svn_username',
  :display_name => 'SVN Username',
  :description => 'The username for your SVN repository',
  :type => 'string',
  :recipes => [ 'deploy::svn' ],
  :required => 'required'
attribute 'deploy/svn_password',
  :display_name => 'SVN Password',
  :description => 'The password for your SVN user',
  :type => 'string',
  :recipes => [ 'deploy::svn' ],
  :required => 'required'
attribute 'deploy/svn_arguments',
  :display_name => 'SVN Extra Arguments',
  :description => 'Extra command line options to pass to svn',
  :type => 'string',
  :recipes => [ 'deploy::svn' ]
attribute 'deploy/path',
  :display_name => 'Deployment Path',
  :description => 'The path to deploy to',
  :type => 'string',
  :recipes => [ 'deploy::svn' ],
  :default => '/srv/app'
