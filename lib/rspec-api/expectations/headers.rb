require 'rspec-api/expectations/headers/content_type'
require 'rspec-api/expectations/headers/page_links'

module RSpecApi
  module Expectations
    module Response
      # Creates an example group for expectations on the response headers of
      # last API request and runs it to verify that it matches best practices:
      # * if request has entity body, the Content-Type header should be JSON
      # * if request has pages, the Link header should have a 'rel=prev' link
      module Headers
        def expect_headers(response, expectations = {})
          context 'responds with headers that' do
            extend ContentType
            extend PageLinks

            expect_content_type response, expectations
            expect_page_links response, expectations
          end if expectations.any?
        end
      end
    end
  end
end