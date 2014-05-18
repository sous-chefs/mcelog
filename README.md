mcelog Cookbook
===============
Installs and configures mcelog for decoding kernel hardware error messages on Linux

Requirements
------------
* Ubuntu 10.04/12.04
* RHEL based system


Attributes
----------

### platform specific attributes (auto set)
* `default['mcelog']['conf_dir']` = '/etc'
* `default['mcelog']['service_name']` = 'mcelogd'

### config options
* `default['mcelog']['cpu']` = nil
* `default['mcelog']['cpumhz']` = nil
* `default['mcelog']['filter']` = 'yes'
* `default['mcelog']['dmi']` = 'no'

### logging options
* `default['mcelog']['syslog']` = 'yes'
* `default['mcelog']['syslog-error']` = 'yes'
* `default['mcelog']['logfile']` = '/var/log/mcelog' # this can only be used if syslog is not active
* `default['mcelog']['filter-memory-errors']` = 'no'
* `default['mcelog']['raw']` = 'no'

### user/group settings
* `default['mcelog']['run-credentials-user']` = 'root'
* `default['mcelog']['run-credentials-group']` = 'root'
* `default['mcelog']['server']['client-user']` = 'root'
* `default['mcelog']['server']['client-group']` = 'root'

### dimm monitoring settings
* `default['mcelog']['dimm']['dimm-tracking-enabled']` = 'yes'
* `default['mcelog']['dimm']['dmi-prepopulate']` = 'yes'
* `default['mcelog']['dimm']['uc-error-threshold']` = '1 / 24h'
* `default['mcelog']['dimm']['ce-error-threshold']` = '10 / 24h'

### cpu monitoring settings
* `default['mcelog']['socket']['socket-tracking-enabled']` = 'yes'
* `default['mcelog']['socket']['mem-uc-error-threshold']` = '100 / 24h'
* `default['mcelog']['socket']['mem-ce-error-trigger']` = 'socket-memory-error-trigger'
* `default['mcelog']['socket']['mem-ce-error-threshold']` = '100 / 24h'
* `default['mcelog']['socket']['mem-ce-error-log']` = 'yes'

### cpu cache settings
* `default['mcelog']['cache']['cache-threshold-trigger']` = 'cache-error-trigger'
* `default['mcelog']['cache']['cache-threshold-log']` = 'yes'

### memory page settings
* `default['mcelog']['page']['memory-ce-threshold']` = '10 / 24h'
* `default['mcelog']['page']['memory-ce-log']` = 'yes'
* `default['mcelog']['page']['memory-ce-action']` = 'soft'

### trigger settings
* `default['mcelog']['trigger']['children-max']` = 2
* `default['mcelog']['trigger']['directory']` = '/etc/mcelog'



Usage
-----
Apply to the node


License and Author
------------------

Author:: Tim Smith - Limelight Networks, Inc. (<tsmith@limelight.com>)

Copyright:: 2013-2014, Limelight Networks, Inc.

License:: Apache 2.0
