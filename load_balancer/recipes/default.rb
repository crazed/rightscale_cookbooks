package 'build-essential'
package 'ruby-dev'
package 'libxml2-dev'
package 'libxslt1-dev'
gem_package 'fog' do
  gem_binary '/opt/rightscale/sandbox/bin/gem'
end
