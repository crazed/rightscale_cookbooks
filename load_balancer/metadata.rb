maintainer       "YOUR_COMPANY_NAME"
maintainer_email "YOUR_EMAIL"
license          "All rights reserved"
description      "Installs/Configures load_balancer"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"
recipe 'load_balancer::default', 'Installs the fog gem'
recipe 'load_balancer::elb_register', 'Registers a node with an elastic load balancing instance'
recipe 'load_balancer::elb_deregister', 'Deregisters a node from an elastic load balancing instance'
attribute 'aws/access_key', 
  :display_name => 'AWS Access Key',
  :description => 'Your AWS access key id',
  :type => 'string',
  :required => 'required',
  :recipes => [ 'load_balancer::elb_register', 'load_balancer::elb_deregister' ]
attribute 'aws/secret_key', 
  :display_name => 'AWS Secret Key',
  :description => 'Your AWS secret key id',
  :type => 'string',
  :required => 'required',
  :recipes => [ 'load_balancer::elb_register', 'load_balancer::elb_deregister' ]
attribute 'elb/name', 
  :display_name => 'ELB Name',
  :description => 'The name of the elastic load balancer instance that you would like to regstier intances to',
  :type => 'string',
  :required => 'required',
  :recipes => [ 'load_balancer::elb_register', 'load_balancer::elb_deregister' ]
