# JS Closures - Skills Workshop

[All Workshops](README.md) | [Source](https://hackmd.io/cIFsMAqISHqVHN_-p9hY0Q)

Learning Objectives

- [ ] Understand JavaScript Closures

Achievement Plan

- [x] Complete the examples provided in the workshop

Evidence

- I have completed the exercises and made notes below.

## Exercises

A closure is a 

### A Basic Counter

Here the function sets a variable n to 0, then returns a function that increments and then returns n.

```js
function makeCounter() {
  var n = 0;
  return function() {
    n = n + 1;
    return n;
  }
}

var counter = makeCounter();
counter(); // 1
counter(); // 2
counter(); // 3
```

### A Counter with a Start Point

Here the variable n is set to with passed argument firstN.

```js
function makeCounter(firstN) {
  var n = firstN;
  return function() {
    n = n + 1;
    return n;
  }
}

var counter = makeCounter(5);
counter(); // 6
counter(); // 7
counter(); // 8
```

### Playing with Lexical Scope

Here the top level variable `greeting` is set with "Hello!". The greet function sets its own local `greeting` variable, then calls an inner function (closure), `displayGreeting()` which makes an alert with the `greeting` variable.

The function will look for the closest definition for `greeting`, which is the scope in which `displayGreeting()` is defined (`greet`), rather than the top level.

If greeting was not declared in `greet()` then it would use the top level definition.

```js
var greeting = "Hello!"; // Top level declaration

function greet() {
  var greeting = "Hi!";        // local variable declaration
  function displayGreeting() { // displayGreeting() is the inner function, a closure
      alert (greeting);        // displayGreeting() uses variable declared in the parent function
  }
  console.log(greeting) // Hi!
  displayGreeting(); // Hi! in an alert box
}

console.log(greeting) // Hello! // as it is in the top level scope
greet(); // Hi! in an alert box
```

The function will maintain its lexical scope regardless of where it is called.

Here instead of executing `displayGreeting()` it is returned by `greet()`, and assigned to `deliverGreeting`.

Now, when `deliverGreeting()` is called, the `displayGreeting` function is called, but it maintains the scope of where it was defined, so the `greeting` variable it uses is the one defined in `greet()` even though it is being called from the top level, where `greeting` is assigned with "Hello!"

```js
var greeting = "Hello!";

function greet() {
  var greeting = "Hi!";
  function displayGreeting() {
      alert (greeting);
  }
  return displayGreeting;
}

console.log(greeting) // Hello! // as it is in the top level scope

var deliverGreeting = greet() // Assign deliverGreeting with the result of greet() (displayGreeting)
deliverGreeting(); // Hi! in an alert box
```

### Semi-Practical Application of Closure

Here there is an example of a Function Factory to make different adders.

```js
function makeAdder(x) {
  return function(y) {
    return x + y;
  };
}

var add5 = makeAdder(5);
var add10 = makeAdder(10);

add5(2);  // 7
add10(2); // 12
```

When `add5` is made with `makeAdder` the function returned looks like this:

```js
add5 = function(y) {
  return 5 + y
}
```

Rather than making a whole bunch of different adders manually, the `makeAdder` function can be used to create them with any value needed.