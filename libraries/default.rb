# determine if we should install or not
def mce_should_install?
  return true if node['mcelog']['always_install']
  return false if platform?('windows') || node['virtualization']['role'] == 'guest'
  true
end

# determine the service name based on platform & version
def mce_service_name
  if platform_family?('rhel') && node['platform_version'].to_i < 7
    'mcelogd'
  else
    'mcelog'
  end
end
