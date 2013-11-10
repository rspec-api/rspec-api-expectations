require 'rspec-api/matchers'

module RSpecApi
  module Expectations
    module Response
      module Headers
        module ContentType
          def expect_content_type(response, expectations = {})
            include RSpecApi::Matchers

            if should_check_content_type(response, expectations)
              it { expect(response).to have_content_type expectations[:type] }
            end
          end

        private

          def should_check_content_type(response, expectations)
            expectations.key?(:type) && has_entity_body?(response)
          end
        end
      end
    end
  end
end