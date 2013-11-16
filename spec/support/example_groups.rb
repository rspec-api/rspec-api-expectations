require 'rspec/matchers'

RSpec::Matchers.define :include_description do |description|
  match do |example_group|
    example_group.children.any?{|e| e.description == description}
  end
end

RSpec::Matchers.define :pass do
  match do |example_group|
    example_group.run
    example_group.children.map(&:examples).flatten.all? do |e|
      e.execution_result[:status] == 'passed'
    end
  end
end

def examples_expecting(expectations = {}, request_params = nil, &block)
  RSpec::Core::ExampleGroup.describe 'An RSpecApi group example' do
    extend RSpecApi::Expectations
    response = OpenStruct.new status: 200,
      headers: {'Content-Type' => 'application/json; charset=utf-8',
                'Link' => '<https://example.com/1>; rel="prev"'},
      body: 'alert([{"id":1,"name":"foo"},{"id":2,"name":"foo"}])'
    if block_given?
      expect_response response, expectations, request_params, &block
    else
      expect_response response, expectations
    end
  end
end