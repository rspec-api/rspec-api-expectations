require 'spec_helper'
require 'rspec-api/expectations'

describe 'expect_headers', sandboxing: true do
  context 'given the right expectation on the response content-type header' do
    let(:examples) { examples_expecting type: :json }
    it { expect(examples).to pass }
  end

  context 'given the wrong expectation on the response content-type header' do
    let(:examples) { examples_expecting type: :xml }
    it { expect(examples).not_to pass }
  end

  context 'given the right expectation on the response Link header' do
    let(:examples) { examples_expecting page_links: true }
    it { expect(examples).to pass }
  end

  context 'given the wrong expectation on the response Link header' do
    let(:examples) { examples_expecting page_links: false }
    it { expect(examples).not_to pass }
  end
end