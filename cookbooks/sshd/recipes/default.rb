#
# Cookbook Name:: sshd
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
if node[:platform].include?('ubuntu')
  template '/etc/ssh/sshd_config' do 
    source 'ubuntu_config.erb'
    variables(
    :response => "no"
    )

  end 

elsif case node[:platform] when 'centos'
  package 'openssh-server'
  package 'openssh-clients'

#   only_if { 'node.["sshd"]["path"] = "false"' }
    bash 'extarct_module' do 
    #interpreter "bash"
    code <<-EOH
    chkconfig sshd on
    service sshd start
    EOH
only_if { 'node.["sshd"]["path"] = "false"' }
    end
   end
end		  
	  
	  
	
#	template "/etc/ssh/sshd_config" do
#	 source "centos_config.erb"
#	  variables(
#
#		:response => "no",
#		:without => "without-password"
#
#	  )

#	end

#end
