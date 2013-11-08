require 'ostruct'

def resourceful_response(options = {})
  status = options.fetch(:status, 200)
  headers = {'Content-Type' => 'application/json; charset=utf-8'}.merge options.fetch(:headers, {})
  body = options.fetch :body, '[]'
  OpenStruct.new status: status, headers: headers, body: body
end

def resourceful_examples(response, expectations = {})
  RSpec::Core::ExampleGroup.describe 'with :status' do
    extend RSpecApi::Expectations::Resourceful
    expect_resourceful response, expectations
  end
end

def run_examples(example_group)
  example_group.run
  example_group.children.map(&:examples).flatten
end

def descriptions_for(example_group)
  example_group.children.map &:description
end