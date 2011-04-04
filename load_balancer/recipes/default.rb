package 'build-essential'
package 'ruby-dev'
package 'libxml2-dev'
package 'libxslt1-dev'

gem_package 'fog' do
  version "0.5.1"
  gem_binary '/opt/rightscale/sandbox/bin/gem'
end

ruby_block 'clear paths' do
  block { Gem.clear_paths }
end
