require 'rspec/core'
require 'rspec-api/expectations/response'

module RSpecApi
  module Expectations
    include Response
  end
end

# RSpecApi::Expectations provides the +expect_response+ method to test RESTful APIs.
#
# To have this method available inside of an RSpec `describe` block, tag that
# block with the `:rspec_api` metadata:
#
#  describe "Artists", rspec_api: true do
#     ... # here you can write `expect_response response, status: :ok, etc.
#  end
RSpec.configuration.extend RSpecApi::Expectations, rspec_api: true

# You can also explicitly extend the example group with RSpecApi::Expectations:
#
#  describe "Artists" do
#     extend RSpecApi::Expectations
#     ... # here you can write `expect_response response, status: :ok, etc.
#  end
#