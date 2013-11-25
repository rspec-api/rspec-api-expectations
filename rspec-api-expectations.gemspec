lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec-api/expectations/version'

Gem::Specification.new do |spec|
  spec.name          = "rspec-api-expectations"
  spec.version       = RSpecApi::Expectations::VERSION
  spec.authors       = ["claudiob"]
  spec.email         = ["claudiob@gmail.com"]
  spec.description   = %q{RSpec expectations useful to test web APIs.}
  spec.summary       = %q{Expectations extracted from rspec-api to chech
    response of pragmatic RESTful web APIs.}
  spec.homepage      = 'https://github.com/rspec-api/rspec-api-expectations'
  spec.license       = 'MIT'

  spec.files         = Dir['{lib}/**/*'] + ['MIT-LICENSE', 'README.md']

  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 1.9.2'
  spec.required_rubygems_version = ">= 1.3.6"

  spec.add_dependency 'rspec'
  spec.add_dependency 'activesupport' # for Array.wrap, slice, concern, ...
  spec.add_dependency 'rspec-api-matchers', '~> 0.7.1' # expect(200).to match_status(200)
  spec.add_dependency 'rack' # for ::Utils

  # For integration tests
  spec.add_dependency 'faraday'

  # For development / Code coverage
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'coveralls'
end