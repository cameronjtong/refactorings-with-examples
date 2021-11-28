#if you must keep method missing, sequester it to its own class
#SRP is to handle the method missing calls

#example

class Recorder
  instance_methods.each do |method|
    undef_method(method) unless method =~ /^(_|inspect)/
  end

  def messages
    @messages ||= []
  end

  def method_missing(sym, *args)
    messages << [sym, args]
    self
  end
end

#imagine now Recorder needs to play back all messages on an object and show calls as strings
#as complexity grows, we will have more explicitly defined methods, and will want a class just for method missing

class MessageCollector
  instance_methods.each do |method|
    undef_method(method) unless method =~ /^(_|inspect)/
  end

  def messages
    @messages ||= []
  end

  def method_missing(sym, *args)
    messages << [sym, args]
    self
  end
  end