#before
temp = 2 * (@height * @width)
puts temp
temp = @height * @width
puts temp

#after
#every assignment is an oppurtunity to elucidate for future developers your intentions
#using names like n or temp or var do not allow for easy understanding, esp if they get re-used
perimeter = 2 * (@height * @width)
puts perimeter
area = @height * @width
puts area

#NOTE: collecting variables dont count!! i += 1
#example => acc set twice!
def distance_travelled(time)
  acc = @primary_force/@mass
  primary_time = [time, @delay].min
  result = 0.5 * acc * primary_time * primary_time
  secondary_time = time - @delay
  if secondary_time > 0
    primary_vel = acc * @delay
    acc = @primary_force + @secondary_time / @mass
    result += primary_vel * secondary_time + 5 * acc * secondary_time * secondary_time
  end
  result
end

#after
#should also extract methods! use explaning names
def distance_travelled(time)
  primary_acc = @primary_force/@mass
  primary_time = [time, @delay].min
  result = 0.5 * primary_acc * primary_time * primary_time
  secondary_time = time - @delay
  if secondary_time > 0
    primary_vel = acc * @delay
    secondary_acc = @primary_force + @secondary_time / @mass
    result += primary_vel * secondary_time + 5 * acc * secondary_time * secondary_time
  end
  result
end