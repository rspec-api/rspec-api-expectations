require 'spec_helper'
require 'rspec-api/expectations'
require_relative 'github_helper'

# An integration test that runs `expect_response` against a live API
# to make sure the result is as expected. This test is not included in
# the default `rspec` because it might feel due to third-party API issues,
# but is useful to see how `expect_response` works in the real world.
#
# In order to run this test, obtain a GitHub API key and store it in the
# environment variable RSPEC_API_GITHUB_TOKEN
#
describe 'GET https://api.github.com/repositories', :remote, :rspec_api do
  response = GitHub.get '/repositories'
  expect_response response, status: :ok, type: :json, collection: true,
    attributes: {id: {type: :number}, name: {type: :string},
                 url: {type: {string: :url}}}
end