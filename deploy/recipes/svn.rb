deploy node.deploy.path do
  repo node.deploy.repository
  svn_username node.deploy.svn_username
  svn_password node.deploy.svn_password
  scm_provider Chef::Provider::Subversion

  if node.deploy.svn_arguments
    svn_arguments node.deploy.svn_arguments
  end

  # remove some rails-isms
  migrate false
  @purge_before_symlink = {}
  @symlinks = {}
end
