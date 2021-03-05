require 'spec_helper'

describe 'default recipe on Ubuntu 20.04' do
  cached(:chef_run) do
    runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '20.04')
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

describe 'default recipe on CentOS 8' do
  cached(:chef_run) do
    runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '8')
    runner.converge('mcelog::default')
  end

  it 'starts mcelog service' do
    expect(chef_run).to start_service('mcelog')
  end

  it 'enables mcelog service' do
    expect(chef_run).to enable_service('mcelog')
  end
end
