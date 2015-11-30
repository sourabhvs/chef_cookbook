#
# Cookbook Name:: sshd
# Recipe:: devops_users
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe "sshd::sshd"
  execute "add_devops" do 
   command 'adduser devops'
   not_if 'getent passwd devops'
  end 

  execute "add_deploy" do
   command 'adduser deploy'
   not_if 'getent passwd deploy'
 end






