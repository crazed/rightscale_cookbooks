package "lvm2"
package "xfsprogs"

devices = [ '/dev/sdk', '/dev/sdl' ]

# setup the mount point
directory node.ebs.mount_point do
  owner "root"
  group "root"
  mode "755"
  recurisve true
  action :create
end



# loop through devices and create the ebs volume
devices.each do |device_id|
  aws_ebs_volume "#{node.ebs.volume_size}GB ebs volume: #{device_id}" do
    aws_access_key node.aws.access_key
    aws_secret_access_key node.aws.secret_key
    size node.aws.volume_size
    device device_id
    action [ :create, :attach ]
  end
  execute "pvcreate #{device_id}"
end

# create the volume gruop
execute "vgcreate ebs #{devices.join(' ')}"

# create the striped logical volume
execute "lvcreate -i#{devices.length} -I4 -l 100%%FREE -n stripe ebs"

# create the file system and mount
execute "mkfs.xfs /dev/ebs/stripe && mount -t xfs /dev/ebs/stripe #{node.ebs.mount_point}"
