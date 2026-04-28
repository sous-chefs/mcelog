# frozen_string_literal: true

unified_mode true

provides :mcelog

property :cpu, String
property :cpumhz, String
property :filter, String, default: 'yes'
property :dmi, String, default: 'no'
property :syslog, String, default: 'yes'
property :syslog_error, String, default: 'yes'
property :logfile, String, default: '/var/log/mcelog'
property :filter_memory_errors, String, default: 'no'
property :raw, String, default: 'no'
property :run_credentials_user, String, default: 'root'
property :run_credentials_group, String, default: 'root'
property :client_user, String, default: 'root'
property :client_group, String, default: 'root'
property :dimm_tracking_enabled, String, default: 'yes'
property :dmi_prepopulate, String, default: 'yes'
property :uc_error_threshold, String, default: '1 / 24h'
property :ce_error_threshold, String, default: '10 / 24h'
property :socket_tracking_enabled, String, default: 'yes'
property :mem_uc_error_threshold, String, default: '100 / 24h'
property :mem_ce_error_trigger, String, default: 'socket-memory-error-trigger'
property :mem_ce_error_threshold, String, default: '100 / 24h'
property :mem_ce_error_log, String, default: 'yes'
property :cache_threshold_trigger, String, default: 'cache-error-trigger'
property :cache_threshold_log, String, default: 'yes'
property :memory_ce_threshold, String, default: '10 / 24h'
property :memory_ce_log, String, default: 'yes'
property :memory_ce_action, String, default: 'soft'
property :children_max, Integer, default: 2
property :trigger_directory, String, default: lazy { platform_family?('rhel') && node['platform_version'].to_i >= 7 ? '/etc/mcelog/triggers' : '/etc/mcelog' }

action_class do
  include Mcelog::Cookbook::Helpers
end

action :install do
  return unless mce_should_install?

  package 'mcelog'

  directory new_resource.trigger_directory do
    owner 'root'
    group 'root'
    mode '0755'
    recursive true
  end

  template '/etc/mcelog/mcelog.conf' do
    cookbook 'mcelog'
    source 'mcelog.conf.erb'
    owner 'root'
    group 'root'
    mode '0644'
    variables(
      cpu: new_resource.cpu,
      cpumhz: new_resource.cpumhz,
      filter: new_resource.filter,
      dmi: new_resource.dmi,
      syslog: new_resource.syslog,
      syslog_error: new_resource.syslog_error,
      logfile: new_resource.logfile,
      filter_memory_errors: new_resource.filter_memory_errors,
      raw: new_resource.raw,
      run_credentials_user: new_resource.run_credentials_user,
      run_credentials_group: new_resource.run_credentials_group,
      client_user: new_resource.client_user,
      client_group: new_resource.client_group,
      dimm_tracking_enabled: new_resource.dimm_tracking_enabled,
      dmi_prepopulate: new_resource.dmi_prepopulate,
      uc_error_threshold: new_resource.uc_error_threshold,
      ce_error_threshold: new_resource.ce_error_threshold,
      socket_tracking_enabled: new_resource.socket_tracking_enabled,
      mem_uc_error_threshold: new_resource.mem_uc_error_threshold,
      mem_ce_error_trigger: new_resource.mem_ce_error_trigger,
      mem_ce_error_threshold: new_resource.mem_ce_error_threshold,
      mem_ce_error_log: new_resource.mem_ce_error_log,
      cache_threshold_trigger: new_resource.cache_threshold_trigger,
      cache_threshold_log: new_resource.cache_threshold_log,
      memory_ce_threshold: new_resource.memory_ce_threshold,
      memory_ce_log: new_resource.memory_ce_log,
      memory_ce_action: new_resource.memory_ce_action,
      children_max: new_resource.children_max,
      trigger_directory: new_resource.trigger_directory
    )
    notifies :restart, "service[#{mce_service_name}]"
  end

  service mce_service_name do
    supports restart: true, status: true
    action [:enable, :start]
    only_if 'mcelog --is-cpu-supported'
  end
end

action :remove do
  service mce_service_name do
    action [:stop, :disable]
    only_if 'mcelog --is-cpu-supported'
  end

  package 'mcelog' do
    action :remove
  end

  file '/etc/mcelog/mcelog.conf' do
    action :delete
  end

  directory new_resource.trigger_directory do
    action :delete
    recursive true
  end
end

action :restart do
  service mce_service_name do
    action :restart
    only_if 'mcelog --is-cpu-supported'
  end
end
