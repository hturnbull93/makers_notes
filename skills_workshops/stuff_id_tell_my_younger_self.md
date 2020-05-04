# Stuff I'd Tell My Younger Self - Dougal Simpson - Lunchtime Talk

[All Workshops](README.md)

[Dougal's blog](https://medium.com/@dougalsimpson)

## Attitude to Development

Doogal is a tech lead. He does a bit of product, but mainly mentoring and guiding more junior devs.

## The Golden Rule

No matter what the question is, the answer can always start with "It depends..."

Things can be tested, implemented in different ways.

Language and frameworks can vary also.

Go with what everyone else is doing, but understand why they are making those choices.

Software engineering is about people, not computers.

Code serves the people using it, not the computer.

The rest of the advice is given with the caveat that everything may "depend"

### Correct Clear Fast

The priority order of software.

#### Correct

First, if not, it is wrong, which is bad.

#### Clear

Second, code is read way more times than it is written.

#### Fast

Third, code needs to be written quickly, but if too fast, compromises made to the flexibility of code.

#### About the codebase

Most code is called one on startup, some is called infrequently, a smaller amount of code is used frequently.

It's important to optimise the small amount of frequently used code fast.

### The Optimisation Loop

1. Write code in a clear manner.

2. Check that the code is fast enough for the business, if it is? Great, stop.
(if anyone complains, then it is not fast enough, do not ask them if they want it faster)

3. Find the bottleneck that is slowing down the code, and fix it.

4. Then check code is fast enough, if it is? Great, stop.

## Alex

Alex is the developer that inherits your code.

Alex is well meaning, unabashed about changing code, but only knows about the code infront of them, no knowledge of design decisions.

### The Ten Second Rule

If you can't understand a method in 10 seconds, it can be made clearer.

- A lot of the time ti could be giving it a good name
- Shorter methods
- Good variable names

Make the amount of code that Alex needs to understand small. Make the context of knowledge needed as small as possible.

### We are all Alex

At some point, we all look over our code we don't remember writing, or someone else's codebase.

## Someone else has written it

We get paid to solve business problems, not write libraries.

Businesses have a problem they do not know how to solve. Engineers write code to fix problems.

Libraries may arise out of problem solving

There are organisations that pay people to write libraries. These people will also make libraries that are better than yours, because that is their focus.

Use libraries for:

- Time - trouble with leap years, leap seconds, timeshifts (bst), before epoch.
- Money - (do not use floating point!!)
- Threads - avoid unless you really really have to.
- Logging - to logfiles etc. console.log is synchronous, so if you do a lot of logging you block the thread a lot.
- Parsing - not hard, but tedious, there are libraries that exist.

Focus on the business problem!

## 