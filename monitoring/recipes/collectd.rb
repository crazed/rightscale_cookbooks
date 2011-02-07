package 'collectd'
template '/etc/collectd/collectd.conf' do
  backup false
  source 'collectd.conf.erb'
  variables(
    :server_uuid => node.rs.server_uuid,
    :sketchy_server => node.rs.sketchy_server
  )
  owner 'root'
  group 'root'
  mode '644'
end
