require 'rspec-api/matchers'
require 'rack/utils'

module RSpecApi
  module Expectations
    module HeadersExpectations
      def expect_content_type_header(response, type)
        expect(response).to include_content_type type
      end

      def expect_prev_page_link_header(response, has_prev_page)
        if has_prev_page == false
          expect(response).not_to have_prev_page_link
        else
          expect(response).to have_prev_page_link
        end
      end
    end
  end
end