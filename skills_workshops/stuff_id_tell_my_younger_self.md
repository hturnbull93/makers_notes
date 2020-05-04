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

#### About the Codebase

Most code is called one on startup just once, some is called infrequently, a smaller amount of code is used frequently.

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

- Time - trouble with leap years, leap seconds, timezone changes (e.g. bst), before epoch.
- Money - (do not use floating point!!)
- Threads - avoid unless you really really have to.
- Logging - to logfiles etc. console.log is synchronous, so if you do a lot of logging you block the thread a lot.
- Parsing - not hard, but tedious, there are libraries that exist.

Focus on the business problem!

## Questions

### How did you decide what you wanted to do?

Just followed whatever what was going on for the first couple of years.

Only with the last couple of jobs did he decided what to work on.

Hiring senior devs is hard as they tend to have strong opinions on subjects at that point.

### What does Babylon do in hiring process to get the developers that align with their schools of thought

Coding interview, pair programming. Not looking for encyclopaedic knowledge, but how their mind works and how they approach problems.

Seniors do systems design interview. Can they build something simple and stupid, (i.e. not a facebook clone immediately), but have an understanding of where it could be expanded to.

### Any recurring patterns from junior devs?

Always ask questions, it reduces the time taken to learn, do not feel ashamed of asking questions.

Good managers will give you time to do self led learning.

### Should we use threading?

It depends. Old days of game dev, there were lots of hacks to work with minimal storage and cpu power.

Now with web, android and iOS, now there is another constrained environment.

In android, one thread is for display, and another thread does the server fetch work.

Hopefully there would be a set of abstractions to make it easier to work with, otherwise it can get tricky.

Threading comes up in interviews, threads and deadlocks, and binary search. Things that never actually get done in work, but the fact you know about them shows you understand what is going on.

### When applying for a job should you be worried about not knowing a language so well?

There's a balance to be struck. The concepts in languages are going to be cross language.

When starting out, you have very little to lose by making the application, be upfront with it.

A good hiring manager will look for personality and drive, rather than specific language trivia.

CS structure, Order of familiarity for languages and frameworks. CVs are buzzword bingo, gets you past recruiter into the hands of the actual hiring manager.

### Senior devs having strong opinions, how do you work with that?

Seniors have enough knowledge to have a strong opinion, but not yet have the understanding that opinion doesn't matter.

"Religious Wars" on things that don't matter as long as they are consistent. Like which of kebab-case, snake_case, or ramcase for url path names.

Junior is about writing code.

Senior is about using code writing and feature creation skills to make working code that solves a problem.

Tech Lead is managing juniors, mids and seniors to make sure they are all working towards the actual goal of the project.
