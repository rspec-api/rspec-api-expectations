require 'rspec-api/expectations/body/collection'
require 'rspec-api/expectations/body/jsonp'
require 'rspec-api/expectations/body/sort'
require 'rspec-api/expectations/body/filter'
require 'rspec-api/expectations/body/attributes'

module RSpecApi
  module Expectations
    module Response
      # Creates an example group for expectations on the response body of the
      # last API request and runs it to verify that it matches best practices:
      # * if response is succesful and has a body
      #   -  the body should be a JSON-marshalled Array or Hash
      #   -  if request has a callback parameter, the body should be JSONP
      #   -  if request has a sort parameter, the body should be sorted
      #   -  if request has a filter parameter, the body should be filtered
      #   -  if some attributes are expected, the body should include them
      module Body
        def expect_body(response, expectations = {})
          context 'responds with a body that' do
            extend Collection
            extend Jsonp
            extend Sort
            extend Filter
            extend Attributes

            expect_a_collection response, expectations
            expect_a_callback_wrapped response, expectations
            expect_a_sorted response, expectations
            expect_a_filtered response, expectations
            expect_attributes response, expectations
          end if expectations.any?
        end
      end
    end
  end
end