#before

def found_friends(people)
  friends = []
  people.each do |person|
    if person == 'Don'
      friends << 'Don'
    end
    if person == 'John'
      friends << 'John'
    end
    if person == 'Kent'
      friends << 'Kent'
    end
  end
  friends
end

#after
#dont have to write out a return value
#dont have to use the shovel operator
def found_friends(people)
  people.select do |person|
    %w(Don John Kent).include?(person)
  end
end