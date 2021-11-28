#named parameter not worth the complexity on the reciever
IsbnSearch.new(:isbn => "gabagaba")

#after

IsbnSearch.new("stringtring")

#hash args add complexity to code

# example - all params are named params, all optional

Books.find
Books.find(:selector => :all,
            :conditions => "authors.name = 'Jenny James'",
            :joins => [:authors])
Books.find(:selector => :first,
            :conditions => "authors.name = 'JennyJames'",
            :joins => [:authors])
#lots of different ways to call

class Books

  def self.find(hash={})
    hash[:joins] ||= []
    hash[:conditions] ||=""

    sql = ["SELECT * FROM books"]
    hash[:joins].each do |join_table|
      sql << "LEFT OUTER JOIN #{join_table}"
      sql << "ON books.#{join_table.to_s.chop}_id = #{join_table}.id"
    end

    sql << "WHERE #{hash[:conditions]}" unless hash[:conditions].empty?
    sql << "LIMIT 1" if hash[:selector] == :first
  end
end

#slector should be required!

 def self.find(selector,hash={})
    hash[:joins] ||= []
    hash[:conditions] ||=""

    sql = ["SELECT * FROM books"]
    hash[:joins].each do |join_table|
      sql << "LEFT OUTER JOIN #{join_table}"
      sql << "ON books.#{join_table.to_s.chop}_id = #{join_table}.id"
    end

    sql << "WHERE #{hash[:conditions]}" unless hash[:conditions].empty?
    sql << "LIMIT 1" if selector == :first
  end

  #change calling code also