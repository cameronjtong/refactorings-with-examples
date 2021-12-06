#refer to 99 bottles
#sometimes you need to operate on a value beyond its capabilities as a 'primitive'
#when you wish you could send a message to a primitive object
#like special formatting, ex. a phone number
#it becomes feature envy if you keep passing the number into methods to sanitize and format it

class Order
  attr_accessor :customer

  def initialize(customer) #treats the customer as a string
    @customer = customer
  end
#rest of class
end

#create a class for it

class Customer
  attr_reader :name

  def initialize(name)
    @name = name
  end

end

#change order to handle the object

class Order
  #removed the accessor for explicit definition below
  def initialize(name)
    @customer = Customer.new(name)
  end

  def customer=(new_name)
    @customer = Customer.new(new_name) #makes sure we always have a customer object, not string
  end
end