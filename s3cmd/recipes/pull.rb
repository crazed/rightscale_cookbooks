# note: you have to specify full path to s3cmd as rightscale includes their own, older version of s3cmd

include_recipe "s3cmd::default"

# make the bucket if it doesn't exist
execute "make_bucket" do
  not_if "/usr/bin/s3cmd ls | awk '{print $3}' |  grep -e ^s3://#{node.s3_bucket}$"
  command "/usr/bin/s3cmd mb #{node.s3_bucket}"
end

execute "s3pull" do
  command "/usr/bin/s3cmd get --recursive s3://#{node.s3_bucket} #{node.code_path}"
end

cron "s3sync" do
  minute "*/#{node.sync_minutes}"
  command "/usr/bin/s3cmd sync s3://#{node.s3_bucket} #{node.code_path}"
end
