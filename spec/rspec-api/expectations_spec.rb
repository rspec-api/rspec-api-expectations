require 'spec_helper'
require 'rspec-api/expectations'

describe RSpecApi::Expectations do
  context 'example groups tagged as :rspec_api', :rspec_api do
    should_respond_to :expect_response
  end

  context 'example groups that extend RSpecApi::Expectations' do
    extend RSpecApi::Expectations
    should_respond_to :expect_response
  end

  context 'other example groups' do
    should_not_respond_to :expect_response
  end
end