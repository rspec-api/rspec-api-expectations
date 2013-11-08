require 'coveralls'
Coveralls.wear!

Dir['./spec/support/**/*'].each {|f| require f}

RSpec.configure do |config|
  config.order = 'random'
  config.filter_run_excluding remote: true
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.around sandboxing: true do |example|
    Sandboxing.sandboxed { example.run }
  end
end

require 'rspec-api/expectations'