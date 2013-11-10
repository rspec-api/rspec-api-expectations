require 'rspec-api/expectations/status/code'

module RSpecApi
  module Expectations
    module Response
      # Creates an example group for expectations on the HTTP status code of the
      # last API request and runs it to verify that it matches +status+.
      module Status
        def expect_status(response, expectations = {})
          context 'responds with a status code that' do
            extend Code
            expect_status_code response, expectations
          end if expectations.any?
        end
      end
    end
  end
end