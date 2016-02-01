#
# Cookbook Name:: mcelog
# Attributes:: default
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

#
# See http://www.mcelog.org/config.html for information on configuring mcelog
#

default['mcelog']['cpu'] = nil
default['mcelog']['cpumhz'] = nil
default['mcelog']['filter'] = 'yes'
default['mcelog']['dmi'] = 'no'

# logging options
default['mcelog']['syslog'] = 'yes'
default['mcelog']['syslog-error'] = 'yes'
default['mcelog']['logfile'] = '/var/log/mcelog' # this can only be used if syslog is not active
default['mcelog']['filter-memory-errors'] = 'no'
default['mcelog']['raw'] = 'no'

# daemonize user/group
default['mcelog']['run-credentials-user'] = 'root'
default['mcelog']['run-credentials-group'] = 'root'

# [server]
default['mcelog']['server']['client-user'] = 'root'
default['mcelog']['server']['client-group'] = 'root'

# [dimm]
default['mcelog']['dimm']['dimm-tracking-enabled'] = 'yes'
default['mcelog']['dimm']['dmi-prepopulate'] = 'yes'
default['mcelog']['dimm']['uc-error-threshold'] = '1 / 24h'
default['mcelog']['dimm']['ce-error-threshold'] = '10 / 24h'

# [socket]
default['mcelog']['socket']['socket-tracking-enabled'] = 'yes'
default['mcelog']['socket']['mem-uc-error-threshold'] = '100 / 24h'
default['mcelog']['socket']['mem-ce-error-trigger'] = 'socket-memory-error-trigger'
default['mcelog']['socket']['mem-ce-error-threshold'] = '100 / 24h'
default['mcelog']['socket']['mem-ce-error-log'] = 'yes'

# [cache]
default['mcelog']['cache']['cache-threshold-trigger'] = 'cache-error-trigger'
default['mcelog']['cache']['cache-threshold-log'] = 'yes'

# [page]
default['mcelog']['page']['memory-ce-threshold'] = '10 / 24h'
default['mcelog']['page']['memory-ce-log'] = 'yes'
default['mcelog']['page']['memory-ce-action'] = 'soft'

# [trigger]
default['mcelog']['trigger']['children-max'] = 2
default['mcelog']['trigger']['directory'] = '/etc/mcelog'
