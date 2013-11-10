require 'rspec-api/matchers'

module RSpecApi
  module Expectations
    module Response
      module Body
        module Jsonp
          def expect_a_callback_wrapped(response, expectations = {})
            include RSpecApi::Matchers

            if should_check_callback_wrapped(response, expectations)
              it { expect(response).to be_wrapped_in_callback expectations[:callback] }
            end
          end

        private

          def should_check_callback_wrapped(response, expectations)
            expectations.key?(:callback)
          end
        end
      end
    end
  end
end