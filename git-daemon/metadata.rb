maintainer       "Datapipe"
maintainer_email "afeid@datapipe.com"
license          "All rights reserved"
description      "Installs/Configures git-daemon and gitweb"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"
recipe "git-daemon::default", "installs and configures git-daemon and gitweb"
attribute 'git/export_path',
  :display_name => "Git Export Path",
  :description => "Path that will be exported by git-daemon",
  :type => "string",
  :default => "/srv/git",
  :recipes => [ 'git-daemon::default' ]
