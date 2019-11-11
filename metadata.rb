name 'mcelog'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache-2.0'
description 'Installs/Configures mcelog to catch and decode hardware errors from the Linux kernel'
version '2.0.0'

%w(debian ubuntu centos redhat fedora oracle scientific).each do |os|
  supports os
end

source_url 'https://github.com/chef-cookbooks/mcelog'
issues_url 'https://github.com/chef-cookbooks/mcelog/issues'
chef_version '>= 12.1' if respond_to?(:chef_version)
