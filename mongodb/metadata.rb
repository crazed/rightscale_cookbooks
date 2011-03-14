maintainer       "Datapipe"
maintainer_email "cloud@datapipe.com"
license          "All rights reserved"
description      "Installs/Configures mongodb"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"
recipe "mongodb::default", "sets up mongodb base install"
