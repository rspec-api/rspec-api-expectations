require 'spec_helper'
require_relative 'github_helper'

# An integration test that runs `expect_resourceful` against a live API
# to make sure the result is as expected. This test is not included in
# the default `rspec` because it might feel due to third-party API issues,
# but is useful to see how `expect_resourceful` works in the real world.
#
# In order to run this test, obtain a GitHub API key and store it in the
# environment variable RSPEC_API_GITHUB_TOKEN
# 
# describe 'GET https://api.github.com/users/rspecapi/gists', :rspec_api_resource do
#   response = GitHub.get '/users/rspecapi/gists'
#   expect_resourceful response, status: :ok, type: :json, array: true
# end