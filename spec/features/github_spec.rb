require 'spec_helper'
require 'rspec-api/expectations'
require 'faraday'

class GitHub
  def self.get(route)
    conn = Faraday.new 'https://api.github.com/' do |c|
      c.use Faraday::Adapter::NetHttp
    end
    conn.headers[:user_agent] = 'RSpec API'
    conn.authorization :token, ENV['RSPEC_API_GITHUB_TOKEN']
    conn.get route
  end
end

# An integration test that runs `expect_response` against a live API
# to make sure the result is as expected. This test is not included in
# the default `rspec` because it might fail due to third-party API issues,
# but is useful to see how `expect_response` works in the real world.
#
# In order to run this test, obtain a GitHub API key and store it in the
# environment variable RSPEC_API_GITHUB_TOKEN
#
describe 'GET https://api.github.com/repositories', :remote, :rspec_api do
  response = GitHub.get '/repositories'
  expectations = {status: :ok, type: :json, collection: true,
                  attributes: {id: {type: :number}, name: {type: :string}}}
  prefix_params = nil
  expect_response response, expectations, prefix_params do |response, params|
    expect(response.headers['server']).to eq 'GitHub.com'
    expect(params).to eq prefix_params
  end
end