action :enable do
  execute 'hostname' do
    command "hostname #{new_resource.hostname}"
    action :nothing
  end
  case node.platform
  when 'ubuntu'
    template '/etc/hostname' do
      backup false
      owner 'root'
      group 'root'
      mode '644'
      source 'hostname.erb'
      variables(:hostname => new_resource.hostname)
      notifies :run, resources(:execute => 'hostname')
    end
  else
    Chef::Log.fatal("Your platform is not supported: #{node.platform}")
    raise
  end
end
