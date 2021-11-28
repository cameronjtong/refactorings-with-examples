# before
managers = []
employees.each do |e|
  managers << e if e.manager?
end
#select or reject would work
employees.select {|e| e.manager?}