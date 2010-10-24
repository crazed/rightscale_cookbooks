# this just fixes apt-get so it doesn't install any recommended or suggested packages
# ex: no apache2 when installing php5

execute "apt-get update" do
  action :nothing
end

remote_file "/etc/apt/apt.conf" do
  owner "root"
  group "root"
  mode "644"
  source "apt.conf"
  notifies :run, resources(:execute => "apt-get update")
end
