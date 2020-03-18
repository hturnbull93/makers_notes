# Week 1

[Week 1 outline](https://github.com/makersacademy/course/blob/master/week_outlines.md#week-1)

**Week 1 Learning Objectives**
- [ ] Test-drive a simple program using objects and methods
- [x] Debug some programs that have errors in them, using an effective debugging process
- [ ] Describe basic OO principles like encapsulation and SRP
- [ ] Pair using the driver/navigator style

**Achievement plans**
- [x] Learn a systematic approach to debugging in the Debugging workshop


---

## Tuesday

**Learning Objective & Achievement Plan**

I will move towards the **Debug some programs that have errors in them, using an effective debugging process** goal by doing the following:

- [ ] Complete the Debugging skills workshop




---

## Wednesday

**Learning Objective & Achievement Plan**

I will move towards the **Test-drive a simple program using objects and methods** goal by doing the following:

- [ ] Complete the TDD a simple program skills workshop
- [ ] Complete the Test Driving Exercises practical

### The TDD Process - Skills Workshop

[Skills Workshop - week 1 - TDD process](https://github.com/makersacademy/skills-workshops/blob/master/week-1/TDD_process.md)

**Learning Objectives**

- [X] Explain why we do TDD
- [x] Describe/diagram TDD as a set of steps
- [x] Apply TDD following the diagram

**Achievement Plan**

- [ ] Follow the TDD process to create a dice app
- [ ] Create a specification from User stories
- [x] Practice writing TDD tests in `rspec`

**Evidence**

I have worked on creating an TDD driven [dice app](https://github.com/hturnbull93/dice-app)

## Notes

TDD is about doing the smallest incremental steps:
- You are not allowed to write any production code unless it is to make a failing unit test pass.
- You are not allowed to write any more of a unit test than is sufficient to fail.
- You are not allowed to write any more production code than is sufficient to pass the one failing unit test.

### TDD Diagram

- User story
- Informs specification
- Write test for that specification feature -> 
- **RED:** Code fails test (as it not yet written)
- **GREEN:** Write the simplest possible code to pass the test
- **REFACTOR:** Reorganise your code for readability and processing optimisation, but no not change functionality.

### Feature Tests vs Unit Tests

Feature Test
- Test the program with things a user would demand
- Checks the program works properly for the user, with all parts interacting correctly overall
- Written from a user's perspective, checking on functionality

Unit Test
- Test an individual function or method, with mocked up dependancies
- Checks this individual part does what you expect
- Written from a programmers perspective, checking on parts that a user will never see

### Examples of User Story

User Story Structure | Example 1 | Example 2
---------|----------|---------
 Who the story is from | As a board game player, | As a board game player,
 The reason for this feature | So that I can play a game | So that I know how many steps I should move
 What feature they want | I want to be able to roll a dice | Rolling a dice should give me a number between 1 and 6

 ### Domain Model

 Take the nouns and verbs from user stories and place them into a table


Object | Messages 
---------|----------
 Board game player |  
 Developer |  
 Dice | roll <br> 1-6 randomly <br> any number of dice <br> total score
 Game | record rolls

---

## Week 1 Afternoon Challenge - Boris Bikes

[GitHub repo](https://github.com/hturnbull93/boris-bikes) with all Learning Objectives, notes, and code.

### Domain Model

<!-- Need to write notes -->

### Feature tests

<!-- Need to write notes -->