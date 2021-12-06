#many equal instances that would be better as one object
#data object vs reference objet
#a data object can be duplcicated throughout code. like Integer
# but a ref object should cause ripples throughout the progran
#we can arrange our code to prevent instance creation and to access a previously defined object

class Customer
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class Order
  def initialize(name)
    @customer = Customer.new(name)
  end

  def customer=(name)
    @customer = Customer.new(name)
  end

  def customer_name
    @customer.name
  end
end

# we want customer to be reference instead of value
#we want one customer to represent one person with one or more orders

class Customer
  def self.create(name)
    Customer.new(name)  #replace constructor with class method
  end
end

class Order
  def initialize(name)
    @customer = Customer.create(name)
  end
end

#now we want to store our existing customers in the customer class

class Cusomer
  #rest of class
  def self.load_customers
    new('WB').store
    new('DC').store
    new('Marvel').store
  end

  def store
    INSTANCES[name] = self #store the object in this hash
  end
  INSTANCES = {}

end

#now we can change the class method we made earlier

class Customer
  def self.customer_with_name(name)
    INSTANCES[name]
  end
end