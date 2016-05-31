require 'spec_helper'

describe 'default recipe on Ubuntu 16.04' do
      cached(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge('mcelog::default')
  end

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end
