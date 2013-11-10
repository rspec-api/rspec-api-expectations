require 'spec_helper'
require 'rspec-api/expectations'

describe 'expect_status', sandboxing: true do
  context 'given the right expectation on the response status' do
    let(:examples) { examples_expecting status: :ok }
    it { expect(examples).to pass }
  end

  context 'given the wrong expectation on the response status' do
    let(:examples) { examples_expecting status: :not_ok }
    it { expect(examples).not_to pass }
  end
end