# note: you have to specify full path to s3cmd as rightscale includes their own, older version of s3cmd

include_recipe "s3cmd::default"

# make the bucket if it doesn't exist
execute "make_bucket" do
  not_if "/usr/bin/s3cmd ls | awk '{print $3}' |  grep -e ^#{node.s3.backup_bucket}$"
  command "/usr/bin/s3cmd mb #{node.s3.backup_bucket}"
end

directory '/opt/utils' do
  owner 'root'
  group 'root'
  mode '755'
  recurisve true
end

template '/opt/utils/s3backup.sh' do
  source "backup.sh.erb"
  mode "750"
  owner "root"
  group "root"
  variables(
    :backup_bucket => node.s3.backup_bucket,
    :bucket_path => node.s3.bucket_path,
    :backup_path => node.s3.backup_path
  )
end

cron "s3cmd backups" do
  hour "2"
  minute "0"
  command "/opt/utils/s3backup.sh"
end
