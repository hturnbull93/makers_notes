# Practical Object-Oriented Design in Ruby - Sandi Metz

## Agile Influences on Design

> You should build software in tiny increments, gradually 
> iterating your way into an application that meets the customer’s true need.

> First, there is absolutely no point in doing a
> Big Up Front Design (BUFD) (because it cannot possibly be correct),
> and second, no one can predict when the application will be
> done (because you don’t know in advance what it will eventually do).

> If lack of a feature will force you out of business today it doesn’t matter how
> much it will cost to deal with the code tomorrow; you must do the best you can in the
> time you have. Making this kind of design compromise is like borrowing time from
> the future and is known as taking on technical debt. This is a loan that will eventually
> need to be repaid, quite likely with interest.

> Inexperienced programmers who do a lot of anticipatory design may never reach a point where their
> earlier design efforts pay off. Skilled designers who write carefully crafted code this
> morning may save money this afternoon.

## Single Responsibility Principle

Code should be easy to change:

- Changes have no unexpected side effects
- Small changes in requirements require correspondingly small changes in code
- Existing code is easy to reuse
- The easiest way to make a change is to add code that in itself is easy to change

Then the code you write should have the following qualities. Code should be:

- Transparent The consequences of change should be obvious in the code that is changing and in distant code that relies upon it
- Reasonable The cost of any change should be proportional to the benefits the change achieves
- Usable Existing code should be usable in new and unexpected contexts
- Exemplary The code itself should encourage those who change it to perpetuate these qualities

Something is worthy of being a class if it has both data and behaviour.

### Cohesion

> If the simplest description you can devise
> uses the word “and,” the class likely has more than one responsibility. If it uses the word
> “or,” then the class has more than one responsibility and they aren’t even very related.

### Don't Predict the Future

> This “improve it now” versus “improve it later” tension always exists. Applications
> are never perfectly designed. Every choice has a price. A good designer understands
> this tension and minimizes costs by making informed tradeoffs between the needs of
> the present and the possibilities of the future.

> Because you are writing changeable code, you are best served by
> postponing decisions until you are absolutely forced to make them. Any decision you
> make in advance of an explicit requirement is just a guess. Don’t decide; preserve your
> ability to make a decision later.

### DRY

> Behavior is captured in methods and invoked by sending messages. When you create
> classes that have a single responsibility, every tiny bit of behavior lives in one and only
> one place. The phrase “Don’t Repeat Yourself ” (DRY) is a shortcut for this idea. DRY
> code tolerates change because any change in behavior can be made by changing code
> in just one place.

### Hide Data Structures with Structs

> The official Ruby documentation (<http://ruby-doc.org/core/classes/Struct.html>)
> defines Struct as “a convenient way to bundle a number of attributes together, using
> accessor methods, without having to write an explicit class.”

Within a class to "wheelify" a 2d array structure into mini Wheel structs:

```ruby
Wheel = Struct.new(:rim, :tire)
def wheelify(data)
  data.collect { |cell| Wheel new(cell[0], cell[1]) }
end
```

Now only the `wheelify` method needs to change if the data structure changes.

### Splitting Methods

Where you can, split responsibilities out of methods. i.e.rather than a `diameters` method iterating over an array and calculating the diameter, extract a `diameter` method to do the calculation, and the `diameters` method iterates calling `diameter`.

```ruby
def diameters
  wheels.collect {|wheel|
  wheel.rim + (wheel.tire * 2)}
end

# instead do

def diameters
  wheels.collect {|wheel| diameter(wheel)}
end

def diameter(wheel)
  wheel.rim + (wheel.tire * 2))
end
```

Now the `diameter` method can be used elsewhere if you only need one diameter for something.

Methods with a single responsibility are:

- **Expose previously hidden qualities** - Having each serve a single purpose clarifies the purpose of the class.
- **Avoid the need for comments** - method names are self documenting, so more and smaller methods increases documentation with less comments.
- **Encourage reuse** - Other programmers will reuse methods they can find instead of duplicating code.
- **Are easy to move to another class** - Easier to extract as they are already extracted from the other method.

## Managing Dependencies