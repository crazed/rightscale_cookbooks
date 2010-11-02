maintainer       "Datapipe"
maintainer_email "afeid@datapipe.com"
license          "All rights reserved"
description      "Installs/Configures rails"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"
recipe "rails::ruby", "installs various ruby dependencies"
recipe "rails::sqlite", "installs sqlite3 and ruby gem"
recipe "rails::thin", "installs and configures thin"
recipe "rails::nginx", "installs and configures nginx to pass traffic down to thin"
recipe "rails::deploy", "deploys code from git repo"
attribute "rails/thin_servers",
  :display_name => "Number of Thin Servers",
  :description => "sets the number of thin servers to start up",
  :type => "string",
  :default => "3",
  :recipes => [ 'rails::nginx', 'rails::thin' ]
attribute "rails/app_path",
  :display_name => "Application Path",
  :description => "specifies the path to your application",
  :default => "/srv/app",
  :recipes => [ 'rails::nginx', 'rails::thin' ]
attribute "rails/repo",
  :display_name => "Application Git Repo",
  :description => "Git repo to pull from for your application",
  :type => "string",
  :required => "required",
  :recipes => [ 'rails::deploy' ]

