require 'rspec'
require 'rspec-api/resourceful'

# Make `expect_resourceful` available in every RSpec ExampleGroup tagged
# as `rspec_api_resource`
RSpec.configure do |c|
  c.extend(RSpecApi::Expectations::Resourceful, rspec_api_resource: true)
end