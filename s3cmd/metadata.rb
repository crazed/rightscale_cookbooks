maintainer       "Datapipe"
maintainer_email "afeid@datapipe.com"
license          "All rights reserved"
description      "Installs/Configures s3cmd"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"
recipe "s3cmd::default", "Installs and configures s3cmd"
attribute	'aws_access_key',
  :display_name => "AWS Access Key",
  :description => "Your AWS access key",
  :type => "string",
  :required => "required",
  :recipes => [ 's3cmd::default' ]
attribute	'aws_secret_key',
  :display_name => "AWS Secret Key",
  :description => "Your AWS Secret Key",
  :type => "string",
  :required => "required",
  :recipes => [ 's3cmd::default' ]
