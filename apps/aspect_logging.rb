require 'aspector'

class ExampleClass
  def test
    p 'test'
  end

  def aa
    p 'aa'
  end
end

class LoggingAspect < Aspector::Base
  ALL_METHODS = /test/

  around ALL_METHODS, except: :class, method_arg: true do |method, proxy, *args, &block|
    class_method = "#{self.class}.#{method}"
    puts "Entering #{class_method}: #{args.join(',')}"
    start_time = Time.now.to_f
    result = proxy.call(*args, &block)
    end_time = Time.now.to_f
    puts "Exiting  #{class_method}: #{result}, spend time=" + (end_time - start_time).to_s
    result
  end
end



LoggingAspect.apply(ExampleClass)
puts 'LoggingAspect is applied'

instance = ExampleClass.new
instance.test

LoggingAspect.disable
puts 'LoggingAspect is disabled'
instance.test

LoggingAspect.enable
puts 'LoggingAspect is enabled'
instance.test

puts 'test others'
instance.aa
