service_name = if os[:family] == 'rhel' && os[:release].to_i < 7
                 'mcelogd'
               else
                 'mcelog'
               end

describe service(service_name) do
  it { should be_enabled }
  it { should be_running }
end
