action :enable do
  execute 'hostname' do
    command "hostname #{new_resource.hostname}"
    action :run
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
    end

    # this makes sure logs are,
    # now using the new hostname
    service 'rsyslog' do
      action :restart
    end
  else
    Chef::Log.info("Your platform is not fully supported: #{node.platform}")
  end
end
