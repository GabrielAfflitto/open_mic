require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/user'
require './lib/joke'

class UserTest < Minitest::Test
  def test_it_exists
    sal = User.new("Sal")

    assert_instance_of User, sal
  end

  def test_it_has_a_name
    sal = User.new("Sal")

    assert_equal "Sal", sal.name
  end

  def test_it_can_have_another_name
    ali = User.new("Ali")

    assert_equal "Ali", ali.name
  end

  def test_jokes_returns_empty_array
    sal = User.new("Sal")

    assert_equal [], sal.jokes
  end

  def test_sal_can_learn_joke
    sal = User.new("Sal")
    joke = Joke.new({id: 1,
                     question: "Why did the strawberry cross the road?",
                     answer: "Because his mother was in a jam."})
    sal.learn(joke)

    assert_equal 1, sal.jokes.count
  end

  def test_sal_can_tell_ali_a_joke
    sal = User.new("Sal")
    ali = User.new("Ali")
    joke = Joke.new({id: 1,
                     question: "Why did the strawberry cross the road?",
                     answer: "Because his mother was in a jam."})
    sal.tell(ali, joke)

    assert_equal 1, ali.jokes.count
  end

  def test_ilana_can_learn_multiple_jokes
    ilana = User.new("Ilana")
    joke_1 = Joke.new({id: 1,
                     question: "Why did the strawberry cross the road?",
                     answer: "Because his mother was in a jam."})
    joke_2 = Joke.new({id: 2,
                       question: "How do you keep a lion from charging?",
                       answer: "Take away its credit cards."})
    ilana.learn(joke_1)
    ilana.learn(joke_2)

    assert_equal 2, ilana.jokes.count
  end

  def test_ilana_can_tell_multiple_jokes_to_josh
    ilana = User.new("Ilana")
    josh = User.new("Josh")
    joke_1 = Joke.new({id: 1,
                     question: "Why did the strawberry cross the road?",
                     answer: "Because his mother was in a jam."})
    joke_2 = Joke.new({id: 2,
                       question: "How do you keep a lion from charging?",
                       answer: "Take away its credit cards."})
    ilana.learn(joke_1)
    ilana.learn(joke_2)
    ilana.perform_routine_for(josh)

    assert_equal 1, josh.jokes.count
  end

end
