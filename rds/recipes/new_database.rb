execute "mysql grants" do
  command "mysql -u root < /tmp/grants.sql && rm -f /tmp/grants.sql"
  action :nothing
end

template "/tmp/grants.sql" do
  not_if "echo 'show databases' | mysql | grep #{node.rds.new_database}"
  source "grants.erb"
  variables(:user => node.rds.new_user, :pass => node.rds.new_password, :database => node.rds.new_database)
  notifies :run, resources(:execute => "mysql grants"), :immediately
end
