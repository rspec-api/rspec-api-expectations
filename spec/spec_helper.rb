require 'coveralls'
Coveralls.wear!

require 'ostruct'
Dir['./spec/support/**/*'].each {|f| require f}

RSpec.configure do |config|
  config.order = 'random'
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.filter_run_excluding remote: true unless ENV['RSPEC_API_GITHUB_TOKEN']
  config.around sandboxing: true do |example|
    Sandboxing.sandboxed { example.run }
  end
end