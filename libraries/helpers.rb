# frozen_string_literal: true

module Mcelog
  module Cookbook
    module Helpers
      def mce_should_install?
        return true if node['mcelog'] && node['mcelog']['always_install']
        return false if platform?('windows') || node['virtualization']['role'] == 'guest'
        true
      end

      def mce_service_name
        if platform_family?('rhel') && node['platform_version'].to_i < 7
          'mcelogd'
        else
          'mcelog'
        end
      end
    end
  end
end
