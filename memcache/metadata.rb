maintainer       "Datapipe"
maintainer_email "cloud@datapipe.com"
license          "All rights reserved"
description      "Installs/Configures memcache"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"
recipe "memcache::default", "installs and configured memcached"
attribute 'memcache/memory_size',
  :display_name => 'Memcache Max Memory',
  :description => 'Maximum memory allocation for memcache in megabytes',
  :type => 'string',
  :default => '64',
  :recipes => [ 'memcache::default' ]
attribute 'memcache/bind_address',
  :display_name => 'Memcache Bind Address',
  :description => 'The address to listen on for memcached.',
  :type => 'string',
  :default => '127.0.0.1',
  :recipes => [ 'memcache::default' ]
attribute 'memcache/port',
  :display_name => 'Memcache Port',
  :description => 'Port for memcache to bind to',
  :default => '11211',
  :recipes => [ 'memcache::default' ]
