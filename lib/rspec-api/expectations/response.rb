require 'active_support/core_ext/hash/slice'
require 'rack/utils'
require 'rspec-api/expectations/status'
require 'rspec-api/expectations/headers'
require 'rspec-api/expectations/body'
require 'rspec-api/expectations/custom'

module RSpecApi
  module Expectations
    module Response
      include Status
      include Headers
      include Body
      include Custom

      def expect_response(response, expectations, prefix_params=nil, &block)
        expect_status response, expectations.slice(*on_status)
        expect_headers response, expectations.slice(*on_headers)
        expect_body response, expectations.slice(*on_body)
        expect_custom response, prefix_params, &block if block_given?
      end

    private

      def on_status
        [:status]
      end

      def on_headers
        [:type, :page_links]
      end

      def on_body
        [:collection, :callback, :sort, :filter, :attributes]
      end

      def success?(response)
        response.status && response.status < 400
      end

      def has_entity_body?(response)
        !Rack::Utils::STATUS_WITH_NO_ENTITY_BODY.include?(response.status)
      end
    end
  end
end