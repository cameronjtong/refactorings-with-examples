#before
mock = Mock.new
expectation = mock.expects(:a_method_name)
expectation.with('arguments')
expectation.returns([1, :array])

#after
#reference this article on the power of the collection pipeline https://martinfowler.com/articles/collection-pipeline/
mock = Mock.new
mock
  .expects(:a_method_name)
  .with('arguments')
  .returns([1,:array])

#example -remember to return self to allow chaining!
# aside - this occured while implementing a linked list when creating the #push method (chain multiple pushes)

class Select
  def options
    @options ||= []
  end

  def add_options(arg)
    options << arg
    self # this will allow chaining. Otherise will not work
  end
end