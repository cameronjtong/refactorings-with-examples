#make more concise by defining dynamically

def failure
  self.state = :failure
end

def error
  self.state = :error
end

#after

def_each :failure, :error do |method_name|
  self.state = method_name
end
# use this to fight duplication
#there is readability lost when you opt to not define explicitly

# example with #def_each

def failure
  self.state = :failure
end

def error
  self.state = :error
end

[:failure, :error].each do |method|
  define_method(method) do
    self.state = method
  end
end

# can also define #def_each

class Class
  def def_each(*method_names, &block)
    method_names.each do |method_name|
      define_method(method_name) do
        instance_exec method_name, &block
      end
    end
  end
end

#example - defining instance methods

def failure
  self.state = :failure
end

def error
  self.state = :error
end

def success
  self.state = :success
end

#after
#see also intoduce class annotation

class Post
  def self.states(*args)
    args.each do |arg|
      define_method(arg) do
        self.state = arg
      end
    end
  end

  states :success, :failure, :error
end

#example definining methods by extending a dynamicaly defined module

class PostData < Struct.new(:post_data)

  def params
    post_data[:params]
  end

  def session
    post_data[:session]
  end
  end

  #after - define methods on individual instances
  #avoid method missing due to poor debugging
  #very poor readability
  #breakdown, grab reference to the singleton class, where we deal with instance specific stuff
  #class eval will execute withiin that scope
  class PostData
    def initialize(post_data)
      (class << self;self;end).class_eval do
        post_data.each_pair do |key, value|
          define_method(key.to_sym) do
            value
          end
        end
      end
    end
  end

  # can also extend Hash in order to implement #to_module, and define an anonymous module

  class Hash
    def to_module
      hash = self
      Module.new do
        hash.each_pair do |key, value|
          define_method(key) do
            value
          end
        end
      end
    end
  end

  class PostData
    def initialize(post_data)
      self.extend(post_data.to_module)
    end
  end