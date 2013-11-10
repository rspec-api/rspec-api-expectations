require 'rspec-api/matchers'

module RSpecApi
  module Expectations
    module Response
      module Body
        module Sort
          def expect_a_sorted(response, expectations = {})
            include RSpecApi::Matchers

            if should_check_sorted(response, expectations)
              it { expect(response).to be_sorted expectations[:sort] }
            end
          end

        private

          def should_check_sorted(response, expectations)
            expectations.key?(:sort)
          end
        end
      end
    end
  end
end