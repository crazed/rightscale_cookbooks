if node.utils.hostname
  utils_set_hostname node.utils.hostname do
    action :enable
  end
end
