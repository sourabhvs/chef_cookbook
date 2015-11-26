#
# Cookbook Name:: ruby_rbenv
# Recipe:: update
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
if node[:platform].include?("centos")
 Chef::Provider::Script 'extract_module' do 
	interpreter "Chef::Provider::Script::Bash"
	code <<-EOH
	sudo yum update 
	EOH
 end
elsif node[:platform].include?("ubuntu")
 Chef::Provider::Script::Bash 'extract_module' do
	user 'vagrant'
	code <<-EOH
	sudo apt-get update
	EOH
 end
end 
