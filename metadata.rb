name             'mcelog'
maintainer       'Tim Smith - Limelight Networks, Inc.'
maintainer_email 'tsmith@llnw.com'
license          'Apache 2.0'
description      'Installs/Configures mcelog to catch and decode hardware errors from the Linux kernel'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.4'

%w(debian ubuntu centos redhat fedora oracle scientific).each do |os|
  supports os
end
