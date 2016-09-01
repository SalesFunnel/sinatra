require 'aspector'

class ExampleClass
  def test
    puts 'test'
  end
  def test2
    p 'test'
  end
end

aspector(ExampleClass) do
  target do
    def do_this
      puts 'do_this'
    end

  end

  before :test, :do_this

  before :test do
    puts 'do_that'
  end
end

ExampleClass.new.test