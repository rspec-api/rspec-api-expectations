require 'rspec-api/matchers'

module RSpecApi
  module Expectations
    module Response
      module Body
        module Attributes
          def expect_attributes(response, expectations = {})
            include RSpecApi::Matchers

            if should_check_attributes(response, expectations)
              it { expect(response).to have_attributes expectations[:attributes] }
            end
          end

        private

          def should_check_attributes(response, expectations)
            expectations.key?(:attributes) && success?(response) && has_entity_body?(response)
          end
        end
      end
    end
  end
end