actions :register
attribute :access_key, :kind_of => String, :required => true
attribute :secret_key, :kind_of => String, :required => true
attribute :elb_name, :kind_of => String, :name_attribute => true
