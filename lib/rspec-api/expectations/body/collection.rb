require 'rspec-api/matchers'

module RSpecApi
  module Expectations
    module Response
      module Body
        module Collection
          def expect_a_collection(response, expectations = {})
            include RSpecApi::Matchers

            if should_check_collection(response, expectations)
              if expectations[:collection]
                it { expect(response).to be_a_collection }
              else
                it { expect(response).not_to be_a_collection }
              end
            end
          end

        private

          def should_check_collection(response, expectations)
            expectations.key?(:collection) && success?(response) && has_entity_body?(response)
          end
        end
      end
    end
  end
end