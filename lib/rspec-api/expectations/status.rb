require 'rspec-api/matchers'

module RSpecApi
  module Expectations
    module StatusExpectations
      def expect_status(response, status)
        expect(response).to have_status status
      end
    end
  end
end