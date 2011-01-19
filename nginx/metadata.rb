maintainer       "Datapipe"
maintainer_email "afeid@datapipe.com"
license          "All rights reserved"
description      "Installs/Configures nginx-web-stack"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"
recipe "nginx::default", "Installs and configured nginx"
recipe "nginx::ssl_termination", "Installs and configures Nginx for SSL termination with HAproxy"
recipe "nginx::proxy", "Installs and configures Nginx for use with a proxy"
attribute 'domain_name',
  :display_name => "Domain",
  :description => "The FQDN of your website",
  :type => "string",
  :required => "required",
  :recipes => [ "nginx::default" ]
attribute 'code_path',
  :display_name => "Document Root",
  :type => "string",
  :required => "required",
  :recipes => [ "nginx::default" ]
attribute 'nginx/ssl_cert',
  :display_name => 'SSL Certificate',
  :description => 'PEM based SSL certificate data',
  :type => 'string',
  :required => 'required',
  :recipes => [ 'nginx::ssl_termination' ]
attribute 'nginx/ssl_key',
  :display_name => 'SSL Key',
  :description => 'PEM based SSL private key data',
  :type => 'string',
  :required => 'required',
  :recipes => [ 'nginx::ssl_termination' ]
attribute 'nginx/load_balancer',
  :display_name => 'Load Balancer URI',
  :description => 'The load balancer URI, ex: localhost:85',
  :type => 'string',
  :default => 'localhost:85',
  :recipes => [ 'nginx::ssl_termination' ]
attribute 'nginx/document_root',
  :display_name => 'Nginx Document Root',
  :description => 'The documentroot for nginx',
  :default => '/srv/http',
  :recipes => [ 'nginx::proxy', 'nginx::ssl_termination' ]
attribute 'nginx/proxy',
  :display_name => 'Nginx Proxy Location',
  :description => 'The server nginx should proxy to',
  :default => 'localhost:81',
  :recipes => [ 'nginx::proxy' ]
