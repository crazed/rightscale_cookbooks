template  '/etc/apt/sources.list.d/karmic.list' do
  source 'karmic.list'
  owner 'root'
  group 'root'
  mode '644'
end

template '/etc/apt/preferences.d/php' do
  source 'php'
  owner 'root'
  group 'root'
  mode '644'
end

execute 'apt-get update'

case node.platform
when 'ubuntu'
  %w(php5 php5-cli php5-gd php5-curl php5-mysql).each do |pkg|
    package pkg
  end
end
