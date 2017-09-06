class User
  attr_reader :name,
              :jokes

  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(joke)
    jokes << joke
  end

  def tell(ali, joke)
    ali.jokes << joke
  end

  def perform_routine_for(josh)
    josh.jokes << 
  end
end
