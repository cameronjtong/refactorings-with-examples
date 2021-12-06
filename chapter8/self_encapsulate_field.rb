#this acts to delegate
#mirrors what an accessor does
#hides the details and allows you to send a terse message to an object
#useful for hiding the @ in instance variables
#the @ symbol outside of initialization is a code smell

def total
  @base_price * 2 + @tax
end

#reduces to this

def total
  base_price * 2 + tax #much more readable
end

#make sure youre using getters and setters where appropriate
#realize that attr_accessor is rarely appropriate