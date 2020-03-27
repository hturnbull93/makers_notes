# Concretes and Abstracts - Skills Workshop

[All Workshops](README.md) | [Source](https://github.com/makersacademy/skills-workshops/tree/master/week-2/oop_2)

Learning Objectives

- [x] Differentiate between 'abstract' and 'concrete'
- [x] Explain what is meant by the advice 'Separate out the things that change from those that stay the same'
- [x] Give some differences between adding features to systems with poor OOP and good OOP

Achievement Plan

- [x] Add some new features to the Animals project in both the terrible and great implementations.

Evidence

- I have implemented new user stories required for the [Animal Calatogue](https://github.com/hturnbull93/skills-workshops/tree/master/week-2/oop_2)

## Notes

Rather than hardcoding many specific concrete reference to things, instead use an general abstracted reference to the kind of thing the program handles:

- 1, 15, 8, -2 _(Number)_
- Red, Green, Blue, Puce _(Colour)_
- XML, HTML, JSON, TXT _(Data type, or interchange format)_

## Practical

Currently implemented User Stories:

> As a user  
> So I can recognise common animals  
> I want to look up identifying information about dogs, cats, and birds

> As a user  
> So I can avoid typos  
> I want to raise an error if I input an unrecognised animal

User stories to implement:

> As a user  
> So I can identify cows  
> I want to look up identifying information about cows

> As a user  
> So I can identify bees  
> I want to look up identifying information about bees

> As a user  
> So I can avoid aggressive animals  
> I want to look up the demeanour of animals

> As a user  
> So I can decide which animals need ceilings on their cages  
> I want to look up whether animals can fly


Here is the completed test spec in animal_catalog_spec.rb:

```ruby
require 'animal_catalog'

describe AnimalCatalog do
  subject(:catalog) { described_class.new }

  describe '#sound' do
    it 'returns the sound of the given animal' do
      expect(catalog.sound(:dog)).to eq "woof"
      expect(catalog.sound(:cat)).to eq "meow"
      expect(catalog.sound(:bird)).to eq "chirp"
      expect(catalog.sound(:bee)).to eq "buzz"
      expect(catalog.sound(:cow)).to eq "moo"
    end

    it 'raises an error given an unrecognised animal' do
      expect { catalog.sound(:garbage) }.to raise_error "Unrecognised animal"
    end
  end

  describe '#number_of_legs' do
    it 'returns the number of legs of the given animal' do
      expect(catalog.number_of_legs(:dog)).to eq 4
      expect(catalog.number_of_legs(:cat)).to eq 4
      expect(catalog.number_of_legs(:bird)).to eq 2
      expect(catalog.number_of_legs(:bee)).to eq 6
      expect(catalog.number_of_legs(:cow)).to eq 4
    end

    it 'raises an error given an unrecognised animal' do
      expect { catalog.number_of_legs(:garbage) }.to raise_error "Unrecognised animal"
    end
  end

  describe '#number_of_wings' do
    it 'returns the number of wings of the given animal' do
      expect(catalog.number_of_wings(:dog)).to eq 0
      expect(catalog.number_of_wings(:cat)).to eq 0
      expect(catalog.number_of_wings(:bird)).to eq 2
      expect(catalog.number_of_wings(:bee)).to eq 2
      expect(catalog.number_of_wings(:cow)).to eq 0
    end

    it 'raises an error given an unrecognised animal' do
      expect { catalog.number_of_wings(:garbage) }.to raise_error "Unrecognised animal"
    end
  end

  describe '#aggressive?' do
    it 'returns true if the animal is aggressive' do
      expect(catalog.aggressive?(:dog)).to eq false
      expect(catalog.aggressive?(:cat)).to eq true
      expect(catalog.aggressive?(:bird)).to eq false
      expect(catalog.aggressive?(:bee)).to eq true
      expect(catalog.aggressive?(:cow)).to eq false
    end

    it 'raises an error given an unrecognised animal' do
      expect { catalog.aggressive?(:garbage) }.to raise_error "Unrecognised animal"
    end
  end

  describe '#can_fly?' do
    it 'returns true if the can fly' do
      expect(catalog.can_fly?(:dog)).to eq false
      expect(catalog.can_fly?(:cat)).to eq false
      expect(catalog.can_fly?(:bird)).to eq true
      expect(catalog.can_fly?(:bee)).to eq true
      expect(catalog.can_fly?(:cow)).to eq false
    end

    it 'raises an error given an unrecognised animal' do
      expect { catalog.can_fly?(:garbage) }.to raise_error "Unrecognised animal"
    end
  end
end
```

### Terrible Implementation

In this implementation there is a procedural logic control flow, which leads to really large and unwieldy code.

This will spiral out of control if more and more animals are added. The more that is added the harder the code is to read, and the harder it is to work with or refactor.

The flog complexity of animal_catalog.rb is terrible:

```
    46.1: flog total
     9.2: flog/method average

     9.7: AnimalCatalog#number_of_legs     ./lib/animal_catalog.rb:18-26
     9.6: AnimalCatalog#sound              ./lib/animal_catalog.rb:2-14
     9.1: AnimalCatalog#number_of_wings    ./lib/animal_catalog.rb:30-36
```

In animal_catalog.rb

```ruby
class AnimalCatalog
  def sound(type)
    if type == :dog
      "woof"
    elsif type == :cat
      "meow"
    elsif type == :bird
      "chirp"
    elsif type == :bee
      "buzz"
    elsif type == :cow
      "moo"
    else
      fail "Unrecognised animal"
    end
  end

  def number_of_legs(type)
    if type == :dog || type == :cat || type == :cow
      4
    elsif type == :bird
      2
    elsif type == :bee
      6
    else
      fail "Unrecognised animal"
    end
  end

  def number_of_wings(type)
    if type == :dog || type == :cat || type == :cow
      0
    elsif type == :bird || type == :bee
      2
    else
      fail "Unrecognised animal"
    end
  end

  def aggressive?(type)
    if type == :dog || type == :bird || type == :cow
      false
    elsif type == :cat || type == :bee
      true
    else
      fail "Unrecognised animal"
    end
  end

  def can_fly?(type)
    if type == :dog || type == :cat || type == :cow
      false
    elsif type == :bird || type == :bee
      true
    else
      fail "Unrecognised animal"
    end
  end
end
```

### Great Implementation

In this implementation AnimalCatalog is a class that stores references to various animal classes, and methods to find out about a passed animal.

Instead of going through a bunch of if else statements to find a concrete hardcoded pieces of data, the responsibility of knowing about that animal is delegated to the animal class, which holds the data about that animal.

Example:

- Calling #sound(dog) will first call ensure_known_animal(dog), checking in the ANIMALS hash to see if that key exists, if not it will raise "Unrecognised animal".
- As dog exists in the hash animal_of_type(dog) is called. This method instantiates a new Dog by referencing the dog key in the hash.
- Chained on is the sound method, when called on a Dog instance will return "woof"

New animals were easily added by creating their own classes in new files, requiring them in animal_catalog.rb and adding their key and value to the hash.

A next step could be to create an Animal class that the sub-classes of animals inherit from, as in general it seems that animals have 4 legs, 0 wings, are not aggressive, and cannot fly. This means Dog could inherit Animal with all the standard Animal methods unchanged (even more DRY).

Flog score is also much improved for animal_catalog.rb:

```
    33.4: flog total
     2.1: flog/method average

     5.5: main#none
     5.0: AnimalCatalog#can_fly?           ./animal_catalog.rb:29-31
     3.5: AnimalCatalog#sound              ./animal_catalog.rb:9-11
     3.5: AnimalCatalog#number_of_legs     ./animal_catalog.rb:14-16
     3.5: AnimalCatalog#number_of_wings    ./animal_catalog.rb:19-21
```

And for the individual animal files:

```
     1.8: flog total
     0.2: flog/method average

     0.2: Cow#number_of_legs               cow.rb:6-7
     0.2: Bee#number_of_legs               bee.rb:6-7
     0.2: Bee#number_of_wings              bee.rb:10-11
     0.2: Bird#number_of_legs              bird.rb:6-7
     0.2: Bird#number_of_wings             bird.rb:10-11
```

In animal_catalog.rb:

```ruby
require 'dog'
require 'cat'
require 'bird'
require 'bee'
require 'cow'

# Understands looking up information about animals
class AnimalCatalog
  def sound(type)
    ensure_known_animal(type)
    animal_of_type(type).sound
  end

  def number_of_legs(type)
    ensure_known_animal(type)
    animal_of_type(type).number_of_legs
  end

  def number_of_wings(type)
    ensure_known_animal(type)
    animal_of_type(type).number_of_wings
  end

  def aggressive?(type)
    ensure_known_animal(type)
    animal_of_type(type).aggressive?
  end

  def can_fly?(type)
    ensure_known_animal(type)
    animal_of_type(type).number_of_wings > 0
  end

  private

  ANIMALS = { dog: Dog, cat: Cat, bird: Bird, bee: Bee, cow: Cow }.freeze

  def ensure_known_animal(type)
    raise "Unrecognised animal" unless ANIMALS.include?(type)
  end

  def animal_of_type(type)
    ANIMALS[type].new
  end
end
```

In dog.rb:

```ruby
class Dog
  def sound
    "woof"
  end

  def number_of_legs
    4
  end

  def number_of_wings
    0
  end

  def aggressive?
    false
  end
end
```
