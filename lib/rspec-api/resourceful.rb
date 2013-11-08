require 'active_support/core_ext/hash/slice'
require 'rspec-api/resourceful/status'
require 'rspec-api/resourceful/headers'
require 'rspec-api/resourceful/body'

module RSpecApi
  module Expectations
    module Resourceful
      include ResourcefulStatus
      include ResourcefulHeaders
      include ResourcefulBody

      def expect_resourceful(response, expectations)
        expect_resourceful_status response, expectations.slice(*on_status)
        expect_resourceful_headers response, expectations.slice(*on_headers)
        expect_resourceful_body response, expectations.slice(*on_body)
      end

    private

      def on_status
        [:status]
      end

      def on_headers
        [:type, :has_prev_page]
      end

      def on_body
        [:collection, :callback, :sort, :filter, :attributes]
      end
    end
  end
end
