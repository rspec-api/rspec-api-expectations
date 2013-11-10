require 'rspec-api/matchers'

module RSpecApi
  module Expectations
    module Response
      module Body
        module Filter
          def expect_a_filtered(response, expectations = {})
            include RSpecApi::Matchers

            if should_check_filtered(response, expectations)
              it { expect(response).to be_filtered expectations[:filter] }
            end
          end

        private

          def should_check_filtered(response, expectations)
            expectations.key?(:filter)
          end
        end
      end
    end
  end
end