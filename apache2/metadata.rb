maintainer       "YOUR_COMPANY_NAME"
maintainer_email "YOUR_EMAIL"
license          "All rights reserved"
description      "Installs/Configures apache2"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"
recipe 'apache2::default', 'installs/configures apache2'
recipe 'apache2::php', 'installs/configures PHP'
attribute 'apache2/document_root',
  :display_name => 'Document Root',
  :description => 'Directory with your web content',
  :type => 'string',
  :default => '/srv/http',
  :recipes => [ 'apache2::default' ]
attribute 'apache2/keep_alives',
  :display_name => 'Keep Alives',
  :description => 'Turn on or off KeepAlive in Apache',
  :type => 'string',
  :choice => [ 'On', 'Off' ],
  :default => 'Off',
  :recipes => [ 'apache2::default' ]
attribute 'apachec2/max_clients',
  :display_name => 'Max Client Connections',
  :description => 'Set the MaxClient directive in Apache2',
  :type => 'string',
  :default => '150',
  :recipes => [ 'apache2::default' ]
attribute 'apache2/mod_rewrite',
  :display_name => 'mod_rewrite enabled',
  :description => 'Whether or not to enable mod_rewrite',
  :type => 'string',
  :choice => [ true, false ],
  :default => true,
  :recipes => [ 'apache2::default' ]
attribute 'apache2/x-forwarded-for_logs',
  :display_name => 'Use X-Forwarded-For in Logs',
  :description => "Set the LogFormat to use X-Forwarded-For (useful for ELB)"
  :choice => [ true, false],
  :default => true,
  :recipes => [ 'apache2::default ']
