package "build-essential"
package "libcurl4-openssl-dev"
package "libssl-dev"
package "zlib1g-dev"

# grab nginx from brightbox with passenger support built in
bash "install nginx with passenger support" do
  cwd "/tmp"
  code <<-EOH
  wget http://apt.brightbox.net/release.asc -O - | apt-key add -
  wget -c http://apt.brightbox.net/sources/lucid/brightbox.list -P /etc/apt/sources.list.d/
  apt-get update
  apt-get install -y nginx-brightbox
  for f in /usr/share/phusion-passenger/*; do ln -s $f /usr/lib/phusion-passenger; done
  EOH
  not_if "test -f /etc/apt/sources.list.d/brightbox.list"
end

template "/etc/nginx/sites-available/default" do
  owner "root"
  group "root"
  mode "644"
  source "nginx-passenger.erb"
  variables(:app_path => node.rails.app_path, :environment => node.rails.environment)
end

service "nginx" do
  supports [ :start, :stop, :reload, :status, :enable ]
  start_command "/etc/init.d/nginx start &"
  running true
  action :start
  pattern "nginx: master"
end
