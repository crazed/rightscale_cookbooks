include_recipe 'load_balancer::default'
gem_package 'fog' do
  gem_binary '/opt/rightscale/sandbox/bin/gem'
end
load_balancer_elb node.elb.name do
  access_key node.aws.access_key
  secret_key node.aws.secret_key
  action :register
end
