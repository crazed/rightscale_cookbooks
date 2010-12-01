gem_package "unicorn"

user "unicorn" do
  # system attribute seems to be missing in chef .8
  #system true
  shell "/bin/false"
end

directory "/etc/unicorn" do
  owner "unicorn"
  group "unicorn"
  mode "755"
end

directory "/var/run/unicorn" do
  owner "unicorn"
  group "unicorn"
  mode "755"
end

template "/etc/unicorn/unicorn.rb" do
  owner "root"
  group "root"
  mode "644"
  source "unicorn.rb.erb"
  variables(:app_path => node.rails.app_path + '/current', :workers => node.rails.workers)
end

service "unicorn" do
  supports [ :start, :stop, :reload, :restart ]
  #start_command "unicorn -c /etc/unicorn/unicorn.rb -E #{node.rails.environment} -D"
  # rails 2.3.8 is not Rack
  start_command "unicorn_rails -c /etc/unicorn/unicorn.rb -E #{node.rails.environment} -D"
  stop_command "kill `cat /var/run/unicorn.pid`"
  reload_command "kill -USR2 `cat /var/run/unicorn.pid`"
  # rails 2.3.8 is not Rack
  #restart_command "kill `cat /var/run/unicorn.pid` && unicorn -c /etc/unicorn -E #{node.rails.environment} -D"
  restart_command "kill `cat /var/run/unicorn.pid` && unicorn_rails -c /etc/unicorn -E #{node.rails.environment} -D"
  action :start
end
