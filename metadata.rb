name 'mcelog'
maintainer 'Tim Smith - Limelight Networks, Inc.'
maintainer_email 'tsmith@llnw.com'
license 'Apache 2.0'
description 'Installs/Configures mcelog to catch and decode hardware errors from the Linux kernel'
version '0.1.5'

%w(debian ubuntu centos redhat fedora oracle scientific).each do |os|
  supports os
end
source_url 'https://github.com/tas50/mcelog' if respond_to?(:source_url)
issues_url 'https://github.com/tas50/mcelog/issues'  if respond_to?(:issues_url)
