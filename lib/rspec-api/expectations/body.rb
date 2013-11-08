require 'rspec-api/matchers'
require 'rack/utils'

module RSpecApi
  module Expectations
    module BodyExpectations
      def expect_a_collection(response, is_collection)
        if is_collection
          expect(response).to be_a_collection
        else
          expect(response).not_to be_a_collection
        end
      end

      def expect_callback_wrapped(response, callback)
        expect(response).to be_a_jsonp callback
      end

      def expect_a_sorted(response, sort = {})
        expect(response).to be_sorted sort
      end

      def expect_a_filtered(response, filter = {})
        expect(response).to be_filtered filter[:value], filter.except(:value)
      end

      def expect_attributes(response, attributes)
        expect(response).to have_attributes attributes
      end

    private

      def successful?(response)
        response.status < 400 && !Rack::Utils::STATUS_WITH_NO_ENTITY_BODY.include?(response.status)
      end
    end
  end
end