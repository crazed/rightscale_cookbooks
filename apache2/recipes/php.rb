case node.platform
when 'ubuntu'
  %w(php5 php5-cli php5-gd php5-curl php5-mysql).each do |pkg|
    package pkg
  end
end

service 'apache2' do
  running true
  action :restart
end
