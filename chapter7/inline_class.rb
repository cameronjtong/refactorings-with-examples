#use the 'runt' class to fold into another
#we have a class not doing enough, could be part of a single abstraction

class Person
  attr_reader :name

  def initialize
    @office_telephone = Telephone.new
  end

  def telephone_number
    office_telephone.telephone_number
  end

  def office_telephone
    @office_telephone
  end
end

class TelephoneNumber #runt class
  attr_accessor :area_code, :number

  def telephone_number
    area_code + number
  end
end

#start by declaring all public methods on the big class
#then change all callers and think about where you should send the message
