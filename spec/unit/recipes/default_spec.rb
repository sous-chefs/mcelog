require 'spec_helper'

describe 'default recipe on Ubuntu 16.04' do
  cached(:chef_run) do
    runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04')
    runner.converge('mcelog::default')
  end

  it 'installs mcelog' do
    expect(chef_run).to install_package('mcelog')
  end

  it 'creates /etc/mcelog' do
    expect(chef_run).to create_directory('/etc/mcelog')
  end

  it 'starts mcelog service' do
    expect(chef_run).to start_service('mcelog')
  end

  it 'enables mcelog service' do
    expect(chef_run).to enable_service('mcelog')
  end
end

describe 'default recipe on CentOS 6' do
  cached(:chef_run) do
    runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '6.9')
    runner.converge('mcelog::default')
  end

  it 'starts mcelog service' do
    expect(chef_run).to start_service('mcelogd')
  end

  it 'enables mcelog service' do
    expect(chef_run).to enable_service('mcelogd')
  end
end

describe 'default recipe on CentOS 7' do
  cached(:chef_run) do
    runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.3.1611')
    runner.converge('mcelog::default')
  end

  it 'starts mcelog service' do
    expect(chef_run).to start_service('mcelog')
  end

  it 'enables mcelog service' do
    expect(chef_run).to enable_service('mcelog')
  end
end
