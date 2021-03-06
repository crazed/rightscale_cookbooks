maintainer       "Datapipe"
maintainer_email "afeid@datapipe.com"
license          "All rights reserved"
description      "Installs/Configures rails"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"
recipe "rails::ruby", "installs various ruby dependencies"
recipe "rails::sqlite", "installs sqlite3 and ruby gem"
recipe "rails::nginx", "installs and configures nginx to pass traffic down to unicorn"
recipe "rails::nginx_ssl", "installs and configures nginx with SSL to pass traffic down to unicorn"
recipe "rails::deploy", "deploys code from git repo"
recipe "rails::rake", "executes rake tasks"
recipe "rails::mysql", "installs mysql gem"
recipe "rails::rollback", "rollback to previous code revision"
recipe "rails::unicorn", "installs and configures unicorn"
recipe "rails::maintenance", "turns the system maintenance page on"
recipe "rails::delayed_jobs", "restarts delayed_jobs"
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
  :recipes => [ 'rails::unicorn', 'rails::nginx', 'rails::nginx_ssl', 'rails::deploy', 'rails::rake', 'rails::maintenance', 'rails::delayed_jobs' ]
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
  :recipes => [ 'rails::unicorn', 'rails::rake', 'rails::deploy', 'rails::delayed_jobs' ]
attribute "rails/branch",
  :display_name => "Branch",
  :description => "Git branch to use",
  :type => "string",
  :default => "master",
  :recipes => [ 'rails::deploy' ]
attribute "rails/maintenance_page",
  :display_name => "Maintenance Page",
  :description => "The filename of your maintenance page, stored in public/system/",
  :type => "string",
  :default => "maintenance.html.not_active",
  :recipes => [ 'rails::maintenance' ]
attribute "rails/ssl_key",
  :display_name => "Nginx SSL Key",
  :description => "SSL key to use",
  :required => "required",
  :recipes => [ 'rails::nginx_ssl' ]
attribute "rails/ssl_cert",
  :display_name => "Nginx SSL Certificate",
  :description => "SSL Certificate to use",
  :required => "required",
  :recipes => [ 'rails::nginx_ssl' ]
