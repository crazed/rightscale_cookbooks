template '/etc/apt/preferences.d/php' do
  source 'php'
  owner 'root'
  group 'root'
  mode '644'
end

package 'python-software-properties'
execute 'add-apt-repository ppa:txwikinger/php5.2'
execute 'apt-get update'

case node.platform
when 'ubuntu'
  %w(php5 php5-cli php5-gd php5-curl php5-mysql).each do |pkg|
    package pkg
  end
end
