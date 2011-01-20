def load_fog_gem
  begin
    require 'fog'
  rescue LoadError
    Chef::Log.fatal("You are missing the 'fog' gem, be sure to run load_balancer::default first.")
  end
end

action :register do
  load_fog_gem
  elb_data = elb.describe_load_balancers(new_resource.elb_name).body
  elb_zones = elb_data['DescribeLoadBalancersResult']['LoadBalancerDescriptions'][0]['AvailabilityZones']
  case elb_zones.include?(node.ec2.placement_availability_zone)
  when true
    elb.register_instances(node.ec2.instance_id, new_resource.elb_name)
    Chef::Log.info("#{node.ec2.instance_id} has been registered to '#{new_resource.elb_name}'")
  else
    Chef::Log.fatal("Your node is not in one of the supported availability zones for '#{new_resource.elb_name}': #{elb_zones}")
    raise
  end
end

action :deregister do
  load_fog_gem
  elb.deregister_instances(node.ec2.instance_id, new_resource.elb_name)
end
