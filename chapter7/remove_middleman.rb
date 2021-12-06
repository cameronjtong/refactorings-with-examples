#a class mostly a delegator
#hiding and delegating are good things, but there is a sweet spot
#this is the inverse of hiding delegate
class Person
  def initialize(department)
    @department = department
  end

  def mangager
    @department.manager # we want to remove this
  end
end

#the call looks like person.manager
#we can make it person.department.manager
#jusr add an accessor for the departent