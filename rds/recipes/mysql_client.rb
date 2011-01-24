case node.platform
when 'ubuntu'
  package 'mysql-client'
else
  Chef::Log.fatal("Your platform is not supported: #{node.platform}")
  raise
end

template "/root/.my.cnf" do
  source "my-cnf.erb"
  owner "root"
  group "root"
  mode "600"
  variables(
    :user => node.rds.user,
    :password => node.rds.password,
    :hostname => node.rds.hostname
  )
end
