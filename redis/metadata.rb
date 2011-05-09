maintainer       "Datapipe"
maintainer_email "cloud.support@datapipe.com"
license          "All rights reserved"
description      "Installs/Configures redis"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"
recipe "redis::install", "installs/configures redis"
