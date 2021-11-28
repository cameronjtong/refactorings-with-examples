#limit how many times eval is necessary
#move eval from method definition to defining the method itself

class Person
  def self.attr_with_default(options)
    options.each do |key, value|
      define_method(key) do
        eval "@#{key} ||= #{value}"
      end
    end
  end

  attr_with_default :emails => "[]", etc
end

#after
#the scope of the eval string was expanded
#can also use def instead of define method

class Person
  def self.attr_with_default(options)
    options.each do |key, value|
      eval "define_method(#{key}) do
      @#{key} ||= #{value}
    end"
    end
  end
end