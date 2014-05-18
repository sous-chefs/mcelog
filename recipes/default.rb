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
unless platform_family?('windows') || node['virtualization']['role'] == 'guest'

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

  # rhel 5 doesn't come with an init script to run in daemonized mode so we need to add it
  if platform_family?('rhel') && node['platform_version'].to_i < 6
    cookbook_file '/etc/init.d/mcelogd' do
      source 'mcelogd_init'
      owner 'root'
      group 'root'
      mode '0755'
    end

    cookbook_file '/etc/sysconfig/mcelogd' do
      source 'mcelogd_sysconfig'
      owner 'root'
      group 'root'
      mode '0644'
    end
  end

  template File.join(node['mcelog']['conf_dir'], 'mcelog.conf') do
    source 'mcelog.conf.erb'
    owner 'root'
    group 'root'
    mode '0644'
    notifies :restart, "service[#{node['mcelog']['service_name']}]"
  end

  service node['mcelog']['service_name'] do
    supports [:restart => true, :status => true]
    action [:enable, :start]
  end

end
