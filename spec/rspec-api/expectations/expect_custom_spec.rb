require 'spec_helper'
require 'rspec-api/expectations'

describe 'expect_custom', sandboxing: true do
  context 'given a passing block' do
    let(:examples) { examples_expecting do
      expect(true).to be_true
    end }
    it { expect(examples).to pass }
  end

  context 'given a failing block' do
    let(:examples) { examples_expecting do
      expect(true).to be_false
    end }
    it { expect(examples).not_to pass }
  end

  context 'passes the response as the first argument to the block' do
    let(:examples) { examples_expecting do |response, _|
      expect(response.status).to eq 200
    end }
    it { expect(examples).to pass }
  end

  context 'passes the prefix params as the second argument to the block' do
    let(:examples) { examples_expecting({}, {foo: :bar}) do |_, prefix_params|
      expect(prefix_params[:foo]).to eq :bar
    end }
    it { expect(examples).to pass }
  end
end

#
#     # Creates an example group for custom expectations passed in a block
#     module Custom
#       def expect_custom(response, prefix_params, &block)
#         context 'matches custom expectations' do
#           it { instance_exec response, prefix_params, &block }
#         end if block_given?
#       end
#     end
#   end
# end
