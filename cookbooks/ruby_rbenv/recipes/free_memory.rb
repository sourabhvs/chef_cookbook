#
# Cookbook Name:: ruby_rbenv
# Recipe:: free_memory
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
include_recipe 'ruby_rbenv::update'
execute 'free_memory' do
command "sync && echo 3 | sudo tee 'node['ruby_rbenv']['path']'"
end


