RSpec::Matchers.define :pass do
  match do |examples|
    examples.all? {|e| e.execution_result[:status] == 'passed' }
  end
end