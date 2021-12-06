#class disobeys the SRP
#should be split into two or more
#as you add features, your code no longer represents a single abstraction

class Person
  attr_reader :name
  attr_accessor :office_area_code, :office_number
  def telephone_number
    office_area_code + office_number
  end
end

#seems like we have a phone number in addition to a person

class TelephoneNumber
end

class Person
  def initialize
    @office_telephone ||= TelephoneNumber.new
  end
end

# we then perform successive move fields

class TelephoneNumber
  attr_accessor :area_code
end

class Person
  def initialize
    @office_telephone ||= TelephoneNumber.new
  end

  def telephone_number
    office_area_code + @office_number
  end

  def office_area_code
    @office_telephone.area_code #encapsulate field
  end
  end

  #and continue the move fields, giving as much responsibility to the new class as optimizes
  #readability