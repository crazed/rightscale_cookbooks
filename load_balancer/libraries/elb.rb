begin
  require 'fog'
rescue LoadError
  Chef::Log.warn("Missing gem 'fog'")
end

module Opscode
  module Aws
    module Elb
      def elb
        @@elb ||= Fog::AWS::ELB.new(:aws_access_key_id => new_resource.access_key, :aws_secret_access_key => new_resource.secret_key)
      end
    end
  end
end
