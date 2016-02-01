#
# Cookbook Name:: mcelog
# Recipe:: default
#
# Copyright 2013-2014, Limelight Networks, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# don't try to install on windows systems or VM guests
if mce_should_install?

  package 'mcelog' do
    action :install
  end

  # the directory containing the triggers gets created by the debian package, but not by the RHEL package
  directory node['mcelog']['trigger']['directory'] do
    owner 'root'
    group 'root'
    mode '0755'
    recursive true
    action :create
  end

  template ::File.join(mce_config_dir, 'mcelog.conf') do
    source 'mcelog.conf.erb'
    owner 'root'
    group 'root'
    mode '0644'
    notifies :restart, "service[#{mce_service_name}]"
  end

  service mce_service_name do
    supports [restart: true, status: true]
    action [:enable, :start]
  end

end
