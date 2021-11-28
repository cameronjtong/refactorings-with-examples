#before

class SearchCriteria
  def initialize(hash)
    @author_id = hash[:author_id]
    @publisher_id = hash[:publisher_id]
    @isbn = hash[:isbn]
  end
  end

  #after

  class SearchCriteria
    hash_initializer :author_id, :publisher_id, :isbn
  end

  #example

class SearchCriteria
  def initialize(hash)
    @author_id = hash[:author_id]
    @publisher_id = hash[:publisher_id]
    @isbn = hash[:isbn]
  end
  end

  #after
  #implement class method

  class SearchCriteria
    def self.hash_initializer(*attribute_names)
      define_method(:initialize) do |*args|
        data = args.first || {}
        attribute_names.each do |attribute_name|
          instance_variable_set "@#{attribute_name}", data[attribute_name]
        end
      end
    end

    hash_initializer :author_id, :publisher_id, :isbn
  end

  #take this a step further by introducing modules

  module CustomInitializers
     def hash_initializer(*attribute_names)
      define_method(:initialize) do |*args|
        data = args.first || {}
        attribute_names.each do |attribute_name|
          instance_variable_set "@#{attribute_name}", data[attribute_name]
        end
      end
    end
  end

  Class.send(:include, CustomInitializers)

  #can now remove the definition in search criteria