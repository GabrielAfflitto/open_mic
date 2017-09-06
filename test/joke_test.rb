require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'

class JokeTest < Minitest::Test
  def test_it_exists
    joke = Joke.new({id: 1,
                     question: "Why did the strawberry cross the road?",
                     answer: "Because his mother was in a jam."})

    assert_instance_of Joke, joke
  end

  def test_that_joke_id_is_1
    joke = Joke.new({id: 1,
                     question: "Why did the strawberry cross the road?",
                     answer: "Because his mother was in a jam."})

    assert_equal 1, joke.id
  end

  def test_for_joke_question
    joke = Joke.new({id: 1,
                     question: "Why did the strawberry cross the road?",
                     answer: "Because his mother was in a jam."})
    expected = "Why did the strawberry cross the road?"

    assert_equal expected, joke.question
  end

  def test_for_answer
    joke = Joke.new({id: 1,
                     question: "Why did the strawberry cross the road?",
                     answer: "Because his mother was in a jam."})
    expected = "Because his mother was in a jam."

    assert_equal expected, joke.answer
  end

end
