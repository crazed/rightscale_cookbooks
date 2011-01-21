HTTP_OK = 200

def load_fog_gem
  begin
    require 'fog'
    Excon.ssl_ca_path = '/etc/ssl/certs' # hack, needed to get rightscale sandbox to use the right certs
  rescue
    Chef::Log.warn("Mising the 'fog' gem")
  end
end

def elb
  @@elb ||= Fog::AWS::ELB.new(:aws_access_key_id => new_resource.access_key, :aws_secret_access_key => new_resource.secret_key)
end

action :register do
  load_fog_gem
  elb_data = elb.describe_load_balancers(new_resource.elb_name).body
  elb_zones = elb_data['DescribeLoadBalancersResult']['LoadBalancerDescriptions'][0]['AvailabilityZones']

  case elb_zones.include?(node.ec2.placement_availability_zone)
  when true
    response = elb.register_instances(node.ec2.instance_id, new_resource.elb_name)
    case response.status
    when HTTP_OK
      Chef::Log.info("ELB: #{node.ec2.instance_id} has been registered to '#{new_resource.elb_name}'")
    else
      Chef::Log.error("ELB: Failed to register: #{response.body}")
      raise
    end
  else
    Chef::Log.fatal("Your node is not in one of the supported availability zones for '#{new_resource.elb_name}': #{elb_zones}")
    raise
  end
end

action :deregister do
  load_fog_gem
  response = elb.deregister_instances(node.ec2.instance_id, new_resource.elb_name)

  case response.status
  when HTTP_OK
    Chef::Log.info("ELB: #{node.ec2.instance_id} has been deregistered from '#{new_resource.elb_name}'")
  else
    Chef::Log.error("ELB: Failed to deregister: #{response.body}")
    raise
  end
end
