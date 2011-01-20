include Opscode::Aws::Elb

action :register do
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
  elb.deregisters(node.ec2.instance_id, new_resource.elb_name)
end
