#if you see more methods on another class using the info more than the class itself, its time to move it
#moving state and behavior to optimize readability
#think about how sandi metz says you should think of objects in terms of the messages you send them

class Account
  def interest_for_amount_days(amount, days)
    @interest_rate * amount * days / 365
  end
end

# move @interest_rate to account type
#the original call will now resemble this

class Account
 def interest_for_amount_days(amount, days)
    @account_type.interest_rate * amount * days / 365
  end
end

#can later audible to self-encapsulate field

class Account
  def interest_for_amount_days(amount, days)
    interest_rate * amount * days / 365
  end

  def interest_rate
    @account_type.interest_rate
  end
end

#or use Forwardable

extend Forwardable

def_delegator :@account_type, :interest_rate, :interest_rate=