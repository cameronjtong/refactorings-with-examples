#before
def charge(amount, credit_card_number)
  begin
    connection = CreditCardNumber.connect(..)
    connection.send(amount, credit_card_number)
  rescue IOError => e
    Logger.log("Couldnt submit order #{@order_number}")
    return nil
  ensure
    connection.close
  end
end

#after

def charge(amount, credit_card_number)
  connect do |connection|
    connection.send(amount, credit_card_number)
  end
end

def connect
  begin
    connection = CreditCardServer.connect
    yield connection # unique code goes here and woud get handed a block by #charge !!
    rescue IOError => e
    Logger.log("Couldnt submit order #{@order_number}")
    return nil
  ensure
    connection.close
  end
end

#example

class Person
  attr_reader :mother, :children, :name

  def iniitialize(name, date_of_birth, date_of_death=nil, mother=nil)
    @name, @mother = name, mother
    @date_of_birth, @date_of_death = date_of_birth, date_of_death
    @children = []
    @mother.add_child(self) if @mother
  end

  def add_child(child)
    @children << child
  end

  def number_of_living_descendants
    children.inject(0) do |count, child|
      count += 1 if child.alive?
      count += child.number_of_living_descendants
    end
  end

  def number_of_descendants_named(name)
    children.inject(0) do |count, child|
      count += if child.name == name
      count += child.number_of_descendants_named(name)
    end
  end

  def alive?
    @date_of_death.nil?
  end
end

#after
#push logic into a block
def number_of_descendants_named(name)
  count_descendants_matching {|descendant| descendant.name == name}
end

protected

def count_descendants_matching(&block)
  children.inject(0) do |count, child|
    count += 1 if yield(child)
    count + child.count_descendants_matching(&block)
  end
end

