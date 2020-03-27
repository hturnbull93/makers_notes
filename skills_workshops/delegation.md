# Delegation - Skills Workshop

[All Workshops](README.md) | [Source](https://github.com/makersacademy/skills-workshops/tree/master/week-2/oop_3)

Learning Objectives

- [x] Describe "delegation" as "one class telling another class to do something and the other class encapsulating how to do it."
- [x] Explain what is meant by the advice "delegate, delegate, delegate".
- [x] Implement OOP delegation.


Achievement Plan

- [x] Refactor a poorly written class to an well implemented class that has the same functionality.

Evidence

- I have completed implementation of a [OO principled TodoList](https://github.com/hturnbull93/skills-workshops/tree/master/week-2/oop_3).

## Notes

Delegation is part of good object oriented design.

A class should tell another class to do something, and the class that has been instructed will encapsulate how to do that thing.

An example:

Rather than a class reaching in to alter attributes of another class manually, it should delegate that responsibility to the other class to alter it's own attribute.

Always be delegating!

## Practical

### Bad implementation

The following class is a bad example, it does not follow OO principles.

TodoList both creates and sets the completeness of a todo item, and also stores and accesses todo items in an array.

```ruby
class TodoList
  def initialize
    @todos = []
  end

  def add(description)
    @todos << { description: description, complete: false }
  end

  def set_complete(index)
    get(index)[:complete] = true
  end

  def to_string
    all.each_with_index.map { |todo, index|
      todo_to_string(todo, index + 1)
    }.join("\n")
  end

  def get(index)
    all[index]
  end

  private

  def all
    @todos
  end

  def todo_to_string(todo, index)
    description = todo[:description]
    complete = todo_completion_to_string(todo)
    "#{index}. #{description} #{complete}"
  end

  def todo_completion_to_string(todo)
    todo[:complete] ? "complete" : "not complete"
  end
end
```

You can tell that the class should be split into more than one class as several of its methods have a common prefix:

#todo_to_string:

- returns a numbered pretty string of todo descriptions and their completeness

#todo_completion_to_string:

- returns a string based on the completeness of the todo that #todo_to_string uses

This suggests to me that there should be a separate Todo class that implements these methods.

TodoList should delegate responsibility to a Todo instance to update its own completeness and provide its own pretty string.


### Refactored with Delegation

Here is a refactored version of the previous code, implementing the OO principle of delegation:

The Todo class now holds responsibility for

- Providing a pretty list item of itself.
- Providing its own completed string to use in the pretty list item.
- Updating its own completeness.

All of these methods will be delegated to the Todo by the TodoList.

TodoList also adds a class using a default parameter, so a different dependency can be injected, for example a mock Todo for testing purposes.

In todo_list.rb

```ruby
require "todo"

class TodoList
  def initialize
    @todos = []
  end

  def add(description, todo_class = Todo)
    @todos << todo_class.new(description)
  end

  def get(index)
    all[index]
  end

  def to_string
    all.each_with_index.map { |todo, index|
      list_number = index + 1
      todo.to_string(list_number)
    }.join("\n")
  end

  def set_complete(index)
    all[index].complete
  end

  private

  def all
    @todos
  end
end
```

In todo.rb:

```ruby
class Todo
  def initialize(description)
    @description = description
    @completed = false
  end

  attr_reader :completed

  def to_string(list_number)
    "#{list_number}. #{@description} #{completed_string}"
  end

  def complete
    @completed = true
  end

  private

  def completed_string
    @completed ? "complete" : "not complete"
  end
end
```
