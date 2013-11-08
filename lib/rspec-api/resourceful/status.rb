require 'rspec-api/expectations/status'

module RSpecApi
  module Expectations
    module ResourcefulStatus
      # Creates an example group for expectations on the HTTP status code of the
      # last API request and runs it to verify that it matches +status+.
      def expect_resourceful_status(response, expectations = {})
        include StatusExpectations

        context 'responds with a status code that' do
          it { expect_status response, expectations[:status] } if expectations[:status]
        end if expectations.any?
      end
    end
  end
end