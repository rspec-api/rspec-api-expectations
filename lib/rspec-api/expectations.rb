require 'rspec/core'
require 'rspec-api/expectations/response'

module RSpecApi
  module Expectations
    include Response
  end
end

# RSpecApi::Matchers adds matchers to test RESTful APIs.
#
# To have these matchers available inside of an RSpec `describe` block, tag that
# block with the `:rspec_api` metadata:
#
#  describe "Artists", rspec_api: true do
#     ... # here you can write `expect(response).to have_status :ok`, etc.
#  end
RSpec.configuration.extend RSpecApi::Expectations, rspec_api: true

# You can also explicitly include the RSpec::Api module inside the example group:
#
#  describe "Artists" do
#     include RSpecApi::Matchers
#     ... # here you can write `expect(response).to have_status :ok`, etc.
#  end
#