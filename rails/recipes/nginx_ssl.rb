package "nginx"

service "nginx" do
  action [:start, :enable]
end

template "/etc/nginx/conf.d/unicorn.conf" do
  owner "root"
  group "root"
  mode "644"
  source "unicorn.conf.erb"
  notifies :restart, resources(:service => "nginx")
end

directory "/etc/nginx/ssl" do
  owner "root"
  group "root"
  mode "750"
  action :create
end

template "/etc/nginx/ssl/key.pem" do
  owner "root"
  group "root"
  mode "600"
  source "pem.erb"
  variables(:pem_data => node.rails.ssl_key)
end

template "/etc/nginx/ssl/cert.pem" do
  owner "root"
  group "root"
  mode "640"
  source "pem.erb"
  variables(:pem_data => node.rails.ssl_cert)
end

template "/etc/nginx/sites-available/default" do
  backup false
  owner "root"
  group "root"
  mode "644"
  source "nginx-default-ssl.erb"
  variables(:app_path => node.rails.app_path)
  notifies :restart, resources(:service => "nginx")
end
