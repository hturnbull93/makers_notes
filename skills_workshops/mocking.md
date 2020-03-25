# Mocking - Skills Workshop

[All Workshops](README.md) | [Source](https://github.com/makersacademy/skills-workshops/tree/master/week-1/mocking_1)

Learning Objectives

- [x] Define a unit test as 'a test for code isolated from all other code'
- [x] Explain that doubles can be used to stop objects-under-test from calling other objects in a program
- [x] Refactor a bunch of un-isolated unit tests into isolated ones using doubles

Achievement Plan

- [x] Practice isolating un-isolated unit tests.

Evidence

- I have isolated some un-isolated unit tests in a [Student test score and feedback program](https://github.com/hturnbull93/skills-workshops/tree/master/week-1/mocking_1)

## Notes

### Unit tests vs Feature tests

Unit tests are testing an isolated method within the black box of the code. The user will not care about this, but as developers we care to make sure they all work as we expect them to.

Feature tests are tests that represent something an actual user may want the program to do. They do not care about the black box, just that the input they give returns the output they want.

### Isolating unit tests

Unit tests focus on one single method of a class usually. Because methods of one class often interact with other objects, it is important to make sure they work in isolation.

Isolating a unit test can be achieved by mocking the objects the method interacts with. In RSpec mocks are refereed to as doubles. Mocks/doubles are fake objects made for the method being tested to interact with, that can be made to respond to certain calls in specified ways.

The real Answer class:

```ruby
class Answer
  def initialize(answer_given, correct_answer)
    @answer_given   = answer_given
    @correct_answer = correct_answer
  end

  def correct?
    @answer_given == @correct_answer
  end
end

Answer.new(10, 10)
```

A mocked Answer object in rspec:

```ruby
let(:correct_answer_dbl) { double("This is needed but doesn't matter??", correct?: true) }
```

The mock/double is a fake Answer object that when correct? is called it will return true.

This allows the score method to be tested in isolation from the Answer class. Even if we broke the Answer class the score method unit test would still work:

```ruby
describe Test do
  # Instead of using actual Answers

  # let(:answers) do
  #   [
  #     Answer.new(5, 5),
  #     Answer.new(7, 7),
  #     Answer.new(1, 1)
  #   ]
  # end

  # set up the double
  let(:correct_answer_dbl) { double(:answer, correct?: true) }

  let(:answers) do
    [
      correct_answer_dbl,
      correct_answer_dbl,
      correct_answer_dbl
    ]
  end

  subject(:test) { Test.new(Date.today, answers) }

  describe '#score' do
    it 'returns the number of correct answers' do
      expect(test.score).to eq 3
    end
  end
end
```

Mocks are also very useful if the dependent objects of the method you are testing have their own dependencies (which may also have their own dependencies down the line too):

```ruby
describe '#test_scores' do
  # Use a test double instead
  let(:test_dbl) { double(:test, pretty_date_taken: Date.today.to_s, score: 1) }

  it 'returns all test scores' do
    # instead of setting up tests with individual answers:

    # test_1 = Test.new(Date.today, [Answer.new(5, 5)])
    # test_2 = Test.new(Date.today, [Answer.new(6, 6)])
    # student = Student.new(tests: [test_1, test_2])

    student = Student.new(tests: [test_dbl, test_dbl])
    expect(student.test_scores).to eq({ "#{ Date.today.to_s }" => [1, 1] })
  end

  it 'defaults to being empty' do
    expect(student.test_scores).to be_empty
  end
end
```
