ssh_dir = '/root/.ssh'
authorized_keys_file = '/root/.ssh/authorized_keys'

directory ssh_dir do
  owner 'root'
  group 'root'
  mode '700'
  action :create
end

# this block appends to the authorized_keys file
ruby_block 'add ssh keys' do
  block do
    File.open(authorized_keys_file, 'a') { |f| f.write(node.ssh.authorized_keys) }
  end
end

file authorized_keys_file do
  owner 'root'
  group 'root'
  mode '644'
end
