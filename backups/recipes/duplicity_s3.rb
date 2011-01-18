# install the dependencies for duplicity
Chef::Log.info("Node: #{p node}")
p node
package 'librsync-dev'
package 'python-dev'

bash 'install duplicity' do
  creates '/usr/local/bin/duplicity'
  user 'root'
  cwd '/tmp'
  code <<-EOH
  wget http://code.launchpad.net/duplicity/0.6-series/0.6.10/+download/duplicity-0.6.10.tar.gz
  tar xzf duplicity-0.6.10.tar.gz
  cd duplicity-0.6.10
  python setup.py install
  EOH
end

# setup a weekly cron task,
# this will run a full backup
template '/etc/cron.weekly/duplicity' do
  owner 'root'
  group 'root'
  mode '750'
  source 'duplicity-full.sh.erb'
  variables(
    :aws_access_key => node.aws.access_key,
    :aws_secret_key => node.aws.secret_key,
    :s3_path => node.backups.s3_bucket,
    :num_full_backups => 1
  )
end

# setup a daily cron task,
# this will run daily incrementals
template '/etc/cron.daily/duplicity' do
  owner 'root'
  group 'root'
  mode '750'
  source 'duplicity-incremental.sh.erb'
  varibles(
    :aws_access_key => node.aws.access_key,
    :aws_secret_key => node.aws.secret_key,
    :s3_path => node.backups.s3_bucket
  )
end
