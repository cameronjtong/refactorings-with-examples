#dont want the pain of #method_missing
#used method missing on Kindergarten exercism problem -- will change

class Decorator
  def initialize(subject)
    @subject = subject
  end

  def method_missing(sym, *args, &block)
    @subject.send(sym, *args, &block)
  end
end

#this is sending the call to the subject instance variable
# we can use the information that we have to define these methods on the instance
# this way invalid method calls will still get a NoMethodError!!
class Decorator
  def initialize(subject)
    (class << self; self; end).class_eval do
      subject.public_methods(false).each do |method|
        define_method(method) do |*args|
          subject.send(method, *args)
        end
      end
    end
  end
end

#example: user defined data to define methods
#check if attributes are nil
#code suffers from debugging issues
class Person
  attr_accessor :name, :age

  def method_missing(sym, *args, &block)
    empty?(sym.to_s.sub(/^empty_/,"").chomp("?"))
  end

  def empty?(sym)
    self.send(sym).nil?
  end
end

#after
# see introduce class annotation

class Person
  def self.attrs_with_empty_predicate(*args)
    attr_accessor *args

    args.each do |attribute|
      define_method("empty_#{attribute}?") do
        self.send(attribute).nil?
      end
    end
  end

  attrs_with_empty_predicate :name, :age
end