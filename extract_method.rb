#before
def print_owing(amount)
  print_banner
  puts "name: #{@name}"
  puts "amount: #{amount}"
end

#after
def print_owing(amount)
  print_banner
  print_details(amount) #pass in amount for extracted method to use
end

def print_details(amount)
  puts "name: #{@name}"
  puts "amount: #{amount}"
end

#example => before

def print_owing
  outstanding = 0.0

  puts "*****************"
  puts "***Customer Owes***"
  puts "*******************"

  @orders.each do |order|
    outstanding += order.amount
  end

  puts "name: #{@name}"
  puts "amount: #{outstanding}"
end

#example - after

def print_banner
   puts "*****************"
  puts "***Customer Owes***"
  puts "*******************"
end

def print_owing
  print_banner
  print_footer
end

def print_footer
  puts "name: #{@name}"
  puts "amount: #{total_charge}"
end

def total_charge
   @orders.reduce(0) {|sum, order| sum + order.amount} #apply collection closure
end

#example with local variables

def