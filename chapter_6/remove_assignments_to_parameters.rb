#before
def discount(input_val, quantity, year_to_date)
  if input_val > 50
    input_val -= 2
  end
end
#after
#only use parameter to refer to what was passed in
#cannot refer to different object
#ruby uses pass by value
def discount(input_val, quantity, year_to_date)
  result = input_val
  if input_val > 50
    result -= 2
  end
end

#demonstration of pass by value

class Ledger < Struct.new(:balance)
  def add(arg)
    @balance += arg
  end
end

class Product
  def self.add_price_by_updating(ledger, price)
    ledger.add(price)
    puts "ledger in #add_price_by_updating: #{ledger.balance}"
  end

  def self.add_price_by_replacing(ledger, price)
    ledger = Ledger.new(ledger.balance + price)
    puts "ledger in #add_price_by_replacing: #{ledger.balance}"
  end
end

first = Ledger.new(0)
Product.add_price_by_updating(first,5)
puts "after updating #{first.balance}"

second = Ledger.new(0)
Product.add_price_by_replacing(second, 5)
puts "after replacing #{second.balance}"