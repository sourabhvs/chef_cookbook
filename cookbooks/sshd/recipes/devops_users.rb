#
# Cookbook Name:: sshd
# Recipe:: devops_users
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe "sshd::sshd"
  script 'add_devops' do
interpreter "bash"  
code <<-EOH
adduser devops
EOH
   not_if 'getent passwd devops'
  end 

  execute "add_deploy" do
   command 'adduser deploy'
   not_if 'getent passwd deploy'
 end

template '/etc/sudoers' do 
source 'sudoers_centos.erb'
mode '0440'
owner 'root'
group 'root'
variables(
:user => "devops"
)
#not_if 'getent passwd devops'
end





