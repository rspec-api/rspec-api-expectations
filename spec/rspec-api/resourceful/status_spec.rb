require 'spec_helper'

describe 'expect_resourceful', sandboxing: true do
  context 'given the response status matches the :status option' do
    let(:response) { resourceful_response }
    before { @group = resourceful_examples response, status: :ok }
    it { expect(run_examples @group).to pass }
  end

  context 'given the response status does not match the :status option' do
    let(:response) { resourceful_response }
    before { @group = resourceful_examples response, status: :not_ok }
    it { expect(run_examples @group).not_to pass }
  end
end