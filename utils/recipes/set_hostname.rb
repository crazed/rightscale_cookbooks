if node.utils.hostname
  utils_set_hostname node.utils.hostname do
    action :enable
  end

  # find the ipv4 address of the server
  ipv4 = nil
  node.network.interfaces[node.network.default_interface].addresses.each do |address|
    if address[1]['family'] == 'inet'
      ipv4 = address[0]
      Chef::Log.info("Found IP Address: #{ipv4}")
    end
  end

  case ipv4
  when nil
    Chef::Log.fatal('Could not find an IPv4 Address')
    raise
  else
    execute 'add to hosts file' do
      hosts_line = "#{ipv4} #{node.utils.hostname}"
      not_if "grep #{hosts_line} /etc/hosts"
      command "echo #{hosts_line} >> /etc/hosts"
    end
  end
end
