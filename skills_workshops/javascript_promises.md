# JavaScript Promises - Skills Workshop

[All Workshops](README.md) | [Source](https://github.com/makersacademy/course/blob/master/pills/js_promises.md)

Learning Objectives

- [x] Learn about promises

Achievement Plan

- [x] Read and make notes on the examples

Evidence

- Evidence 1

## Notes

Promises are an alternative to callbacks when dealing with async functions.

### An Example Promise

The each `.then` chained call will execute when the previous promise is resolved successfully.

A `.catch` could be chained on the end which will execute if any of the promises (`.then`s) fail.

```js
get('story.json')
  .then(function(response){
    console.log("Success!", response);
  })
  .then(get('story2.json'))
  .then(JSON.parse, function(error) {
    console.error("Failed!", error);
});
```
