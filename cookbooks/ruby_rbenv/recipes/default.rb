#
# Cookbook Name:: ruby_rbenv
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
include_recipe 'ruby_rbenv::free_memory'
include_recipe 'ruby_rbenv::update'
include_recipe 'ruby_rbenv::git'
