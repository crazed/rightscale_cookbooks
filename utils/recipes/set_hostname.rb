if node.utils.hostname
  utils_set_hostname node.utils.hostname do
    action :enable
  end

  # find the ipv4 address of the server
  ipv4 = nil
  node.network.interfaces[node.network.default_interface].addresses.each do |address|
    Chef::Log.info("Address: #{address[0]}")
    if address[1]['family'] == 'inet'
      ipv4 = address
      Chef::Log.info("Found IP Address: #{ipv4}")
    end
  end

  case ipv4
  when nil
    Chef::Log.fatal('Could not find and IPv4 Address')
    raise
  else
    execute 'add to hosts file' do
      not_if "grep #{ipv4} /etc/hosts"
      command "echo #{ipv4} >> /etc/hosts"
    end
  end
end
