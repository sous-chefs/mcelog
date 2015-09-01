name 'mcelog'
maintainer 'Tim Smith'
maintainer_email 'tsmith84@gmail.com'
license 'Apache 2.0'
description 'Installs/Configures mcelog to catch and decode hardware errors from the Linux kernel'
version '0.2.0'

%w(debian ubuntu centos redhat fedora oracle scientific).each do |os|
  supports os
end

source_url 'https://github.com/tas50/chef-mcelog' if respond_to?(:source_url)
issues_url 'https://github.com/tas50/chef-mcelog/issues' if respond_to?(:issues_url)
