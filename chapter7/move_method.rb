#a method is operating on features of another class more than its own
#note that this is a cure for feature envy
#sometimes easier to move a bunch of methods at once
#check superclasses and subclasses, define in the target class

#example
class Account
  def overdraft_charge
    if @account_type.premium?
      result = 10
      result += (@days_overdrawn - 7) * 0.85 if @days_overdrawn > 7
      result
    else
      @days_overdrawn * 1.75
    end
  end

  def bank_charge
    result = 4.5
    result += overdraft_charge if @days_overdrawn > 0
    result
  end
end

#now imagine we want to introduce multiple account types with unique overdraft charges
#since #overdraft_charge operates on the account type, we can move it there and pass in number of days overdrawan

class AccountType
   def overdraft_charge(days_overdrawn)
    if premium?
      result = 10
      result += (days_overdrawn - 7) * 0.85 if days_overdrawn > 7
      result
    else
      days_overdrawn * 1.75
    end
  end
end

class Account
  def overdraft_charge
    @account_type.overdraft_charge(@days_overdrawn)
  end
end

# to take it one step further we can inline method? I think thats what its called
class Account
  def bank_charge
    result = 4.5
    result += @account_type.overdraft_charge(@days_overdrawn) if @days_overdrawn > 0
    result
  end
end

# can get around other roadblocks by passing the object into the new method
