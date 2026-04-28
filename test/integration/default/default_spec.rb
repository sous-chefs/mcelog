# frozen_string_literal: true

service_name = if os.redhat? && os[:release].to_i < 7
                 'mcelogd'
               else
                 'mcelog'
               end

describe package('mcelog') do
  it { should be_installed }
end

describe service(service_name) do
  it { should be_enabled }
  # mcelog is hardware dependent and will fail to start on unsupported CPUs (like AMD in GHA)
  # or in environments without /dev/mcelog. We check if it's running only if it's supported.
  it { should be_running } if bash('mcelog --is-cpu-supported').exit_status == 0
end

describe file('/etc/mcelog/mcelog.conf') do
  it { should exist }
  it { should be_file }
  its('owner') { should eq 'root' }
  its('group') { should eq 'root' }
  its('mode') { should cmp '0644' }
end

trigger_dir = if os.redhat? && os[:release].to_i >= 7
                '/etc/mcelog/triggers'
              else
                '/etc/mcelog'
              end

describe directory(trigger_dir) do
  it { should exist }
end
