maintainer       "Datapipe"
maintainer_email "afeid@datapipe.com"
license          "All rights reserved"
description      "Installs/Configures s3cmd"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"
recipe "s3cmd::default", "Installs and configures s3cmd"
recipe "s3cmd::sync", "Syncs an s3 bucket path to a specific directory"
recipe "s3cmd::pull", "Pulls down data from an s3 bucket to a specific directory"
recipe "s3cmd::backup", "Backs up a filesystem path to and S3 bucket"
attribute "s3/backup_bucket",
  :display_name => "S3 Backup Bucket",
  :description => "Enter the name of the bucket you would like to backup direcotries to",
  :type => "string",
  :required => "required",
  :recipes => [ 's3cmd::backup' ]
attribute "s3/bucket_path",
  :display_name => "S3 Bucket Path",
  :description => "The path in your S3 bucket to store backup files",
  :type => "string",
  :required => "required",
  :recipes => [ 's3cmd::backup' ]
attribute "s3/backup_path",
  :display_name => "Backup Path",
  :description => "The full path you would like backed up to S3, this will be tar gzipped",
  :type => "string",
  :required => "required",
  :recipes => [ 's3cmd::backup' ]
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
attribute 'code_path',
  :display_name => "Document Root",
  :type => "string",
  :required => "required",
  :recipes => [ "s3cmd::sync", "s3cmd::pull" ]
attribute 'sync_minutes',
  :display_name => "Sync Every X Minutes",
  :type => "string",
  :required => "recommended",
  :recipes => [ "s3cmd::sync" ],
  :default => "15"
attribute 's3_bucket',
  :display_name => "S3 Bucket Path",
  :description => "Path in an s3 bucket to pull data from",
  :required => "required",
  :recipes => [ "s3cmd::sync", "s3cmd::pull" ]
