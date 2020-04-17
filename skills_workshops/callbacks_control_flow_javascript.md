# Callbacks and Control Flow - Skills Workshop

[All Workshops](README.md) | [Source](https://github.com/makersacademy/skills-workshops/tree/master/week-5/callbacks_following_the_flow_of_control)

Learning Objectives

- [ ] Describe "the flow of control of a program" as "the order in which the parts of the code are executed".
- [ ] Explain the process you use to follow the flow of control.
- [ ] Follow the flow of control to help you understand how callbacks work.

Achievement Plan

- [ ] AP

Evidence

- Evidence 1

## Notes

### Control Flow

This is the order in which parts are executed.

In the following code, the console will log: 

- 1
- 2
- 3
- the click event and object
- 4

```js
console.log(1)

$(document).click(function(clickEvent) {
   console.log(3)
   console.log("The click event:", clickEvent)
   console.log(4)
});

console.log(2)
```

### Synchronous Callback Functions

A callback function is a function passed into another function as an argument, which is then invoked in the outer function.

In the following, `greeting` and `loudGreeting` are defined.

Then the `processUserInput` takes an argument of a callback function, which can be either of `greeting` of `loudGreeting`.

In this function a name is prompted for, then the name is passed into whichever callback was passed in.

As this function is executed immediately, this is a Synchronous callback.

```js
function greeting(name) {
  alert('Hello ' + name);
}

function loudGreeting(name) {
  alert('HELLO ' + name.toUpperCase() + '!');
}

function processUserInput(callback) {
  var name = prompt('Please enter your name.');
  callback(name);
}

processUserInput(greeting);

processUserInput(loudGreeting);
```

### Asynchronous Callback Functions

Here, `fetch` takes a single parameter of what to fetch, and returns a promise, meaning it does not block the rest of the code from running.

The promise is an object representing the completion or failure of the async operation.

A `then` call is made with a callback function that will run if the previous operation succeeds. Each callback receives as input the result of the previous operation.

- First `then` takes the stream of input from the fetch and parses it to a JSON with `json`.
- Second `then` does something with the parsed JSON object.

The `catch` call will run if any of the previous `then`s fail.

```js
fetch('products.json').then(function(response) {
  return response.json();
}).then(function(json) {
  // Does something with the parsed JSON
}).catch(function(err) {
  console.log('Fetch problem: ' + err.message);
});
```

Here's the same code with console logs to show the order in which they execute.

Promises are put into the event queue, which runs after the main thread has finished processing, so they don't block.

```js
console.log(1)

fetch('products.json').then(function(response) {
  console.log(3)
  return response.json();
}).then(function(json) {
  console.log(4)
  // Does something with the parsed JSON
}).catch(function(err) {
  console.log('Fetch problem: ' + err.message);
});

console.log(2)
```

However, a risk of this is that synchronous code cannot rely on something returned from asynchronous code, because all the synchronous code will execute before the async event queue is started.