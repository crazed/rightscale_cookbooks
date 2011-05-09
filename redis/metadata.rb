maintainer       "Datapipe"
maintainer_email "cloud.support@datapipe.com"
license          "All rights reserved"
description      "Installs/Configures redis"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"
recipe "redis::install", "installs/configures redis"
attribute 'redis/bind_address',
  :display_name => 'Redis Bind Address',
  :description => 'Address to listen on for Redis',
  :default => '127.0.0.1',
  :recipes => [ 'redis::install' ]
attribute 'redis/listen_port',
  :display_name => 'Redis Bind Port',
  :description => 'The port Redis should listen on',
  :default => '6379',
  :recipes => [ 'redis::install' ]
attribute 'redis/loglevel',
  :display_name => 'Redis Log Level',
  :description => 'Log level to set for Redis',
  :choice => [ 'debug', 'verbose', 'notice', 'warning' ],
  :default => 'notice',
  :recipes => [ 'redis::install' ]
