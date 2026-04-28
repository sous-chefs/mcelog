# frozen_string_literal: true

require 'spec_helper'

describe 'test::default' do
  step_into :mcelog

  context 'when on Ubuntu' do
    platform 'ubuntu'

    before do
      stub_command('mcelog --is-cpu-supported').and_return(true)
    end

    it 'installs mcelog package' do
      is_expected.to install_package('mcelog')
    end

    it 'creates the trigger directory' do
      is_expected.to create_directory('/etc/mcelog')
    end

    it 'renders the mcelog.conf template' do
      is_expected.to create_template('/etc/mcelog/mcelog.conf')
    end

    it 'enables and starts the service' do
      is_expected.to enable_service('mcelog')
      is_expected.to start_service('mcelog')
    end
  end

  context 'when on CentOS 7' do
    platform 'centos', '7'

    before do
      stub_command('mcelog --is-cpu-supported').and_return(true)
    end

    it 'creates the trigger directory' do
      is_expected.to create_directory('/etc/mcelog/triggers')
    end

    it 'enables and starts the mcelog service' do
      is_expected.to enable_service('mcelog')
      is_expected.to start_service('mcelog')
    end
  end
end
