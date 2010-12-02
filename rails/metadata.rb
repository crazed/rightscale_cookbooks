maintainer       "Datapipe"
maintainer_email "afeid@datapipe.com"
license          "All rights reserved"
description      "Installs/Configures rails"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"
recipe "rails::ruby", "installs various ruby dependencies"
recipe "rails::sqlite", "installs sqlite3 and ruby gem"
recipe "rails::nginx", "installs and configures nginx to pass traffic down to unicorn"
recipe "rails::deploy", "deploys code from git repo"
recipe "rails::rake", "executes rake tasks"
recipe "rails::mysql", "installs mysql gem"
recipe "rails::rollback", "rollback to previous code revision"
recipe "rails::unicorn", "installs and configures unicorn"
attribute "rails/workers",
  :display_name => "Number Unicorn Workers",
  :description => "sets the number of workers to spawn for unicorn",
  :type => "string",
  :default => "5",
  :recipes => [ 'rails::unicorn' ]
attribute "rails/app_path",
  :display_name => "Application Path",
  :description => "specifies the path to your application",
  :default => "/srv/app",
  :recipes => [ 'rails::unicorn', 'rails::nginx', 'rails::deploy', 'rails::rake' ]
attribute "rails/repo",
  :display_name => "Application Git Repo",
  :description => "Git repo to pull from for your application",
  :type => "string",
  :required => "required",
  :recipes => [ 'rails::deploy' ]
attribute "rails/rake_tasks",
  :display_name => "Rake Tasks",
  :description => "Space separated rake tasks to execute",
  :type => "string",
  :default => "gems:install db:migrate",
  :recipes => [ 'rails::rake' ]
attribute "rails/environment",
  :display_name => "Rails Environment",
  :description => "The environment you want to install with",
  :type => "string",
  :default => "production",
  :recipes => [ 'rails::unicorn', 'rails::rake', 'rails::deploy' ]
