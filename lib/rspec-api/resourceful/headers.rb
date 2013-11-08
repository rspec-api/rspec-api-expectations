require 'rspec-api/expectations/headers'

module RSpecApi
  module Expectations
    module ResourcefulHeaders
      # Creates an example group for expectations on the response headers of
      # last API request and runs it to verify that it matches best practices:
      # * if request has entity body, the Content-Type header should be JSON
      # * if request has pages, the Link header should have a 'rel=prev' link
      def expect_resourceful_headers(response, expectations = {})
        include HeadersExpectations

        context 'responds with headers that' do
          it { expect_content_type_header response, expectations[:type] } if expectations[:type] && !Rack::Utils::STATUS_WITH_NO_ENTITY_BODY.include?(response.status)
          it { expect_prev_page_link_header response, expectations[:has_prev_page] } if expectations.key?(:has_prev_page)
        end if expectations.any?
      end
    end
  end
end