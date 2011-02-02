maintainer       "Datapipe"
maintainer_email "afeid@datapipe.com"
license          "All rights reserved"
description      "Installs/Configures apt"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"
recipe "apt::default", "configures apt to not install recommended or suggested packages"
recipe "apt::auto_remove", "runs apt-get autoremove -y"
