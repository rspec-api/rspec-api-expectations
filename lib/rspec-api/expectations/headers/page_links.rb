require 'rspec-api/matchers'

module RSpecApi
  module Expectations
    module Response
      module Headers
        module PageLinks
          def expect_page_links(response, expectations = {})
            include RSpecApi::Matchers

            if should_check_page_links(response, expectations)
              if expectations[:page_links]
                it { expect(response).to have_page_links }
              else
                it { expect(response).not_to have_page_links }
              end
            end
          end

        private

          def should_check_page_links(response, expectations)
            expectations.key?(:page_links)
          end
        end
      end
    end
  end
end