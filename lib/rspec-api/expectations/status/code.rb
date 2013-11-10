require 'rspec-api/matchers'

module RSpecApi
  module Expectations
    module Response
      module Status
        module Code
          def expect_status_code(response, expectations = {})
            include RSpecApi::Matchers

            if should_check_status_code(response, expectations)
              it { expect(response).to have_status expectations[:status] }
            end
          end

        private

          def should_check_status_code(response, expectations)
            expectations.key?(:status)
          end
        end
      end
    end
  end
end