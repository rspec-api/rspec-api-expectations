require 'rspec-api/expectations/body'
require 'rack/utils'

module RSpecApi
  module Expectations
    module ResourcefulBody
      # Creates an example group for expectations on the response body of the
      # last API request and runs it to verify that it matches best practices:
      # * if response is succesful and has a body
      #   -  the body should be a JSON-marshalled Array or Hash
      #   -  if request has a callback parameter, the body should be JSONP
      #   -  if request has a sort parameter, the body should be sorted
      #   -  if request has a filter parameter, the body should be filtered
      #   -  if some attributes are expected, the body should include them
      def expect_resourceful_body(response, expectations = {})
        include BodyExpectations
        context 'responds with a body that' do
          it { expect_a_collection response, expectations[:collection] } if expectations.key?(:collection)  && response.status && response.status < 400 && !Rack::Utils::STATUS_WITH_NO_ENTITY_BODY.include?(response.status)
          it { expect_callback_wrapped response, expectations[:callback] } if expectations[:callback]
          it { expect_a_sorted response, expectations[:sort] } if expectations[:sort]
          it { expect_a_filtered response, expectations[:filter] } if expectations[:filter]
          it { expect_attributes response, expectations[:attributes] } if expectations[:attributes] && response.status && response.status < 400 && !Rack::Utils::STATUS_WITH_NO_ENTITY_BODY.include?(response.status)
        end if expectations.any?
      end
    end
  end
end