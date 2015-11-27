#
# Cookbook Name:: ruby_rbenv
# Recipe:: update
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
if node[:platform].include?("centos")
 script 'extract_module' do 
	interpreter "bash"
	code <<-EOH
	yum -y update 
	EOH
 end
elsif node[:platform].include?("ubuntu")
 Chef::Provider::Script::Bash 'extract_module' do
	user 'vagrant'
	code <<-EOH
	apt-get update
	EOH
 end
end 
