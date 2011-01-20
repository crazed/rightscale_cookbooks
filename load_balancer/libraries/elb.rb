begin
  require 'fog'
rescue LoadError
  Chef::Log.warn("Missing gem 'fog'")
end

module Opscode
  module Aws
    module Elb
      def elb
        @@elb ||= FOG::AWS::ELB.new(:aws_access_key_id => new_resource.access_key_id, :aws_secret_access_key => new_resource.secret_access_key)
      end
    end
  end
end
