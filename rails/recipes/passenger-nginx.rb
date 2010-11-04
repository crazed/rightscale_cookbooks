package "build-essential"
package "libcurl4-openssl-dev"
package "libssl-dev"
package "zlib1g-dev"

gem_package "passenger"

# grab nginx from brightbox with passenger support built in
bash "install nginx with passenger support" do
  cwd "/tmp"
  code <<-EOH
  wget http://apt.brightbox.net/release.asc -O - | apt-key add -
  wget -c http://apt.brightbox.net/sources/lucid/brightbox.list -P /etc/apt/sources.list.d/
  apt-get update
  EOH
  not_if "test -f /etc/apt/sources.list.d/brightbox.list"
end

package "nginx-brightbox"

service "nginx" do
  action :stop
end

template "/etc/nginx/sites-available/default" do
  owner "root"
  group "root"
  mode "644"
  source "nginx-passenger.erb"
  variables(:app_path => node.rails.app_path)
  notifies :restart, resources(:service => "nginx")
end
