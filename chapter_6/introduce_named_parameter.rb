#parameters in call cannot be understood by name
#convert to hash!

SearchCriteria.new(5,8,"01029384")

SearchCriteria.new(:author_id => 5....)

#i personally perfer the keyword argument

SearchCriteria.new(author_id: 5, publisher_id: 8, isbn: "longstring")
#this will simplify complex algos
#improve readability

#example 1

class SearchCriteria < Struct.new(:author_id, :publisher_id, :isbn)
end

criteria = SearchCriteria.new(5,8, "nfii94")
#hard to discern
#use hash arguments!

class SearchCriteria < Struct.new(:author_id, :publisher_id, :isbn, keyword_init: true)
  end

  #will now accept hash/keyword args



