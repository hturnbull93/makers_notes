# JavaScript Module Patterns - Skills Workshop

[All Workshops](README.md) | [Source](https://github.com/makersacademy/skills-workshops/tree/master/week-7/javascript-module-pattern-workshop) | [Source 2](https://github.com/makersacademy/course/blob/master/pills/javascript_module_pattern.md)

Learning Objectives

- [x] Understand Immediately Invoked Function Expressions
- [x] Understand how to export modules for use elsewhere

Achievement Plan

- [x] Annotate the examples

Evidence

- I have made notes on the examples below

## Notes

### Immediately Invoked Function Expressions

An IIFE (pronounced "iffy") is an anonymous function that is immediately executed:

```js
(function() {
  console.log("hi");
})();
```

It cannot be referenced, as it is anonymous:

```js
(function () {
  var EXCLAMATION_MARK_COUNT = 5

  function exclaim(string) {
    return string + "!".repeat(EXCLAMATION_MARK_COUNT);
  };

  exclaim("Hi")
  // Hi!!!!!
})();

// throws a ReferenceError, exclaim is defined in an anonymous function.
exclaim("hi");

// Also ReferenceError
console.log(EXCLAMATION_MARK_COUNT);
```

### Exporting Modules

An IIFE can be converted into a module that exports certain variables and functions defined within it.

In `exclaim.js`:

```js
(function(exports) {
  var EXCLAMATION_MARK_COUNT = 5

  function exclaim(string) {
    return string + "!".repeat(EXCLAMATION_MARK_COUNT);
  };

  // Add exclaim to the exports, which is the global this. i.e. window.
  // This variable is named exports by convention.
  exports.exclaim = exclaim;
  // this is the global scope this, i.e. the window.
})(this);

// Hi!!!!!
console.log(exclaim("hi"));

// throws a ReferenceError, as not exported.
console.log(EXCLAMATION_MARK_COUNT);
```

### Using Modules Elsewhere

In 'index.html':

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- The three js files are sourced -->
  <script src="exclaim.js"></script>
  <script src="repeat.js"></script>
  <script src="app.js"></script>

  <title>Document</title>
</head>

<body>
</body>

</html>
```

In `exclaim.js`:

```js
(function (exports) {
  var EXCLAMATION_MARK_COUNT = 5

  function exclaim(string) {
    // exclaim now uses the repeat function exported from repeat.js
    return string + repeat("!", EXCLAMATION_MARK_COUNT);
  };

  exports.exclaim = exclaim

})(this);
```

In `repeat.js`:

```js
(function(exports) {
  function repeat(string, count) {
    return string.repeat(count);
  };

  console.log(exports)

  exports.repeat = repeat;
})(this);

```

In `app.js`:

```js
// Using exclaim
console.log(exclaim("hi"));
```
