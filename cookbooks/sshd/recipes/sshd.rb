#
# Cookbook Name:: sshd
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

#Run chef client as a daemon 
#execute 'run-chef-daemon' do 
# command 'chef-client -i 1800'
#end

# if the node is ubuntu (only for disabling password authentication )

if node[:platform].include?('ubuntu')
  template '/etc/ssh/sshd_config' do 
    source 'ubuntu_config.erb'
    variables(
    :response => "no"
    )

  end 

# if node is centos disable password authentication and install open SSH if not present and restart the ssh service

elsif case node[:platform] when 'centos'

  package 'openssh-server'
  package 'openssh-clients'

    bash 'extarct_module' do 
    code <<-EOH
    chkconfig sshd on
    service sshd start
    EOH

only_if { 'node.["sshd"]["path"] = "false"' }
    end

   template "/etc/ssh/sshd_config" do
    source "centos_config.erb"
     variables(
      :response => "no",
      :without => "without-password"
     )
   end

  end

  execute 'restart_service' do 
   command 'service sshd restart'
  end 

end
