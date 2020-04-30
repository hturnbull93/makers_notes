# Async and the Event Loop - Skills Workshop

[All Workshops](README.md) | [Source]()

Learning Objectives

- [x] Understand the Event Loop

Achievement Plan

- [x] Research the Event Loop

Evidence

- I have researched and made notes on the Event Loop

## The Event Loop

![The Event Loop](/images/event_loop_diagram.png)

### The Stack and async Web APIs

JS runs in the stack.

async functions, setTimeout, AJAX requests, event listeners etc are sent to the Web APIs.

When it is time for something from the Web APIs to occur, that event is pushed onto the one of the queues.

### setTimeout

setTimeout sets a timer going in the Web APIs and when that is complete the callback is added to the Task queue.

### Promises

When promises are resolved they get sent to the Microtask queue.

### The Three Task Queues

When the stack is clear, tasks are executed in the following order:

- The entire Microtasks queue.
- An item from the Tasks queue is moved to the stack.

As part of render steps the animation callbacks are executed:

- Animation Callback queue.
- Calculate styles.
- Calculate layout.
- Paint.

### How Queues Execute

- Tasks: move one item to stack if stack is empty and execute it.
- Animation callbacks: execute all items present when execution started (new items are not executed).
- Microtasks: execute all items until the queue is cleared.

### Event Loop Resources

[Loupe](http://latentflip.com/loupe/)

[Jake Archibald: In The Loop - JSConf.Asia](https://www.youtube.com/watch?v=cCOL7MC4Pl0)
