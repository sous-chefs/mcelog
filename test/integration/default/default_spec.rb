service_name = if os.redhat? && os[:release].to_i < 7
                 'mcelogd'
               else
                 'mcelog'
               end

describe service(service_name) do
  # it { should be_enabled } # disable until inspec can figure this out on systemd based systems
  it { should be_running }
end
