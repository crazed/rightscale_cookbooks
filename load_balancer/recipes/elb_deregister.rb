include_recipe 'load_balancer::default'
load_balancer_elb node.elb.name do
  access_key node.aws.access_key
  secret_key node.aws.secret_key
  action :deregister
end
