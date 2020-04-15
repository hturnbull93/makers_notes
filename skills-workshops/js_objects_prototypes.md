# JS Objects and Prototypes - Skills Workshop

[All Workshops](README.md) | [Source](https://hackmd.io/nb1VZarCTGicD6dMOo43Ww)

Learning Objectives

- [ ] Learn a programming construct by exploring and reasoning about examples

Achievement Plan

- [ ] Complete the examples provided in the workshop

Evidence

- Evidence 1

## Exercises

### Objects and JSON

The following is how objects are made in JS. They are similar to Ruby's hashes, but can be accessed with dot notation as well as bracket notation.

The structure of an object is JSON, JavaScript Object Notation, which can often be in its own separate file.

```js
var cat = {
  sound: "meow!",
  legs: 4
};

console.log(cat.sound); // meow!
console.log(cat.legs); // 4

console.log(cat.['sound']); // meow!
console.log(cat.['legs']); // 4

var dog = { sound: "woof!", legs: 4 };

console.log(dog.sound); // woof!
console.log(dog.legs); // 4

dog.sound = "bork!";

console.log(dog.sound); // bork!
```

### Functions and Parameters

Functions (methods, when within the scope of an object), are similar to Ruby's methods.

Functions _MUST_ be called with the parentheses, even if there are no arguments.

They can be stored in variables.

```js
var sayHello = function() {
  return "Hello!";
};

sayHello(); // Hello!

sayHello; // ƒ () {
          //   return "Hello!";
          // }

var sayHiTo = function(name) {
  return "Hi " + name + "!";
};

sayHiTo("Dave"); // Hi Dave!
```

They can be declared as functions, the following is equivalent:

```js
function sayHello() {
  return "Hello!";
};

sayHello(); // Hello!

function sayHiTo(name) {
  return "Hi " + name + "!";
};

sayHiTo("Dave"); // Hi Dave!
```

In ES6 they can be declared as arrow functions, which is longer for non anonymous functions, but shorter for anonymous functions.
The following is equivalent:

```js
var sayHello = () => {
  return "Hello!";
};

sayHello(); // Hello!

var sayHiTo = (name) => {
  return "Hi " + name + "!";
};

sayHiTo("Dave"); // Hi Dave!
```

### Assigning Objects Keys with Functions

Keys of an objects can be assigned with functions, which can then be called by using dot notation on the object.

```js
var sayMeow = function() {
  return "Meow!";
};

sayMeow(); // Meow!

var cat = { legs: 4 };

// Assign the function to cat.speak
cat.speak = sayMeow;

cat.speak(); // Meow!
```

Objects can include functions when created too.

```js
var cat = {
  speak: function() {
    return "Meow!";
  },
  legs: 4
};

cat.speak(); // Meow!
```

This is where arrow functions work well. As they reduce the amount of characters.

cat.speak holds an anonymous function.

The following is equivalent.

```js
var cat = {
  speak: () => {
    return "Meow!";
  },
  legs: 4
};

cat.speak(); // Meow!
```

### Referring to an objects properties with `this`

The this keyword will look for the key in the scope of the object that has the method being called.

Here, this.legs refers to cat.legs.

```js
var cat = {
  speak: function() {
    return "I have " + this.legs + " legs! Meow!";
  },
  legs: 4
};

cat.speak(); // I have 4 legs! Meow!
cat.legs = 5;
cat.speak(); // I have 5 legs! Meow!
```