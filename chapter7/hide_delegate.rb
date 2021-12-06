#client is calling a delegagte class of an object
#you know too much about the implementation if this is the case
#hide your fields, in general you should inject your dependancies
#can create a delegating method

class Person
  attr_accessor :department
end

class Department
  attr_reader :manager

  def iniitialize(manager)
    @manager = manager
  end
end

#the call to find manager would be person.dept.manager
#what you should do is hide this

class Person
  #rest of class
  def manager
    @department.manager
  end
end