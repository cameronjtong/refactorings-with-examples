#too long with too many temps to extract method
class Order
  def price
    primary_base_price = 0
    secondary_base_price = 0
    tertiary_base_price = 0
    #long computation
  end
end

#after
# steps
#create new class, give attributes for each temp
class Order
  def price
  end
end

class Price
  def charge
  end
end

#example

class Account
  def gamma(input_val, quantity, year_to_date)
    important_value1 = (input_val * quantity) + delta
    important_value2 = (input_val * year_to_date) + 100
    if (year_to_date - important_value1) > 100
      important_value2 -= 20
    end
    important_value3 = important_value2 * 7
    # cont'd
    important_value3 - 2 * important_value1
  end
end

# start by declaring new class

class Gamma
  attr_reader :account, :input_val, :quantity, :year_to_date, :important_value1,
              :important_value2, :important_value3

  def initialize(account, input_val, quantity, year_to_date)
    @account = account
    @input_val = input_val
    @quantity = quantity
    @year_to_date = year_to_date
  end

  def compute
    @important_value1 = (input_val * quantity) + @account.delta
    # and so on
  end
end
#pass in self to access delta!
class Account
  def gamma(....)
    Gamma.new(self,......).compute
  end
  end