maintainer       "Datapipe"
maintainer_email "afeid@datapipe.com"
license          "All rights reserved"
description      "Installs/Configures backups"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"
recipe 'backups::duplicity_s3', 'Backup using duplicity to an S3 bucket'
attribute 'backups/s3_bucket',
  :display_name => 'Backup S3 Bucket',
  :description => 'The S3 bucket to use for backups',
  :type => 'string',
  :required => 'required',
  :recipes => [ 'backups::duplicity_s3' ]
attribute 'aws/access_key',
  :display_name => 'AWS Access Key',
  :description => 'Your AWS Access Key',
  :type => 'string',
  :required => 'required',
  :recipes => [ 'backups::duplicity_s3' ]
attribute 'aws/secret_key',
  :display_name => 'AWS Secret Key',
  :description => 'Your AWS Secret Key',
  :type => 'string',
  :required => 'required',
  :recipes => [ 'backups::duplicity_s3' ]
