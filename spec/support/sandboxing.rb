class NullObject
  private
  def method_missing(method, *args, &block)
    # ignore
  end
end

module Sandboxing
  def self.sandboxed(&block)
    @orig_config = RSpec.configuration
    @orig_world  = RSpec.world
    new_config = RSpec::Core::Configuration.new
    new_world  = RSpec::Core::World.new(new_config)
    RSpec.configuration = new_config
    RSpec.world = new_world
    object = Object.new
    object.extend(RSpec::Core::SharedExampleGroup)

    (class << RSpec::Core::ExampleGroup; self; end).class_eval do
      alias_method :orig_run, :run
      def run(reporter=nil)
        orig_run(reporter || NullObject.new)
      end
    end

    RSpec::Core::SandboxedMockSpace.sandboxed do
      object.instance_eval(&block)
    end
  ensure
    (class << RSpec::Core::ExampleGroup; self; end).class_eval do
      remove_method :run
      alias_method :run, :orig_run
      remove_method :orig_run
    end

    RSpec.configuration = @orig_config
    RSpec.world = @orig_world
  end
end
