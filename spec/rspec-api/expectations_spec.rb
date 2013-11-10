require 'spec_helper'
require 'rspec-api/expectations'

describe RSpecApi::Expectations, sandboxing: true do
  context 'example groups tagged as :rspec_api', :rspec_api do
    respond_to = respond_to? :expect_response
    it 'have access to the expectations' do
      expect(respond_to).to be_true
    end
  end

  context 'example groups that include RSpecApi::Expectations' do
    extend RSpecApi::Expectations
    respond_to = respond_to? :expect_response
    it 'have access to the expectations' do
      expect(respond_to).to be_true
    end
  end

  context 'other example groups' do
    respond_to = respond_to? :expect_response
    it 'do not have access to the expectations' do
      expect(respond_to).to be_false
    end
  end
end