#
# Cookbook Name:: ruby_rbenv
# Recipe:: git
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
if node[:platform].include?("centos") && node[:platform_version].include?("6.7")
	script "extract_module" do
	 interpreter "bash"
	  code <<-EOH
	  yum -y groupinstall "Development Tools"
	  yum -y install gettext-devel openssl-devel perl-CPAN perl-devel zlib-devel expat-devel curl-devel
	  yum -y install  gcc perl-ExtUtils-MakeMaker
	  yum -y remove git
	  wget https://github.com/git/git/archive/v2.5.3.tar.gz -O git.tar.gz
	  tar -zxf git.tar.gz
	  cd git-2.5.3	
	  make configure
	  ./configure --prefix=/usr/local
	  make install
	  EOH
	end
end
