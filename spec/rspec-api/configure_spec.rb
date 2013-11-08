require 'spec_helper'

module Available
  def available?(method)
    status = methods.include?(method) ? 'available' : 'unavailable'
    "#{method} is #{status}"
  end
end

describe 'expect_resourceful' do
  extend Available

  context 'in ExampleGroups tagged :rspec_api_resource', :rspec_api_resource do
    puts available?(:expect_resourceful)
  end

  context 'in ExampleGroups not tagged :rspec_api_resource' do
    puts available?(:expect_resourceful)
  end
end