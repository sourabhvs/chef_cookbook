#
# Cookbook Name:: denyhost
# Recipe:: denybash
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

bash "installing_deny" do 
user 'root'
cwd '/home/vagrant'
code <<-EOH
sudo rpm -Uvh http://mirror.metrocast.net/fedora/epel/6/i386/epel-release-6-8.noarch.rpm
sudo yum install denyhosts
EOH

template "/etc/hosts.allow" do
        source "hostsallow.erb"
        variables(
            :firstip => "123.63.138.164",
            :secondip => "182.156.77.154",
          )
end
command "/etc/init.d/denyhosts restart"
<%= render "denyhost.erb", :variables => {:thresholdvalid => '5',:thresholdinvalid => '3'}, %>


 
