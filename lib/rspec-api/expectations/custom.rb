module RSpecApi
  module Expectations
    module Response
      # Creates an example group for custom expectations passed in a block
      module Custom
        def expect_custom(response, prefix_params, &block)
          context 'matches custom expectations' do
            it { instance_exec response, prefix_params, &block }
          end if block_given?
        end
      end
    end
  end
end