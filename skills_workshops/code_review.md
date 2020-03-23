# Code Review - Skills Workshop

[All Workshops](README.md) | [Source](https://github.com/makersacademy/skills-workshops/tree/master/week-2/code_review)

**Learning Objectives**

- [x] Describe high quality code
- [x] Explain why dev teams do code reviews
- [x] Use a GitHub pull request to review someone else's code

**Achievement Plan**

- [x] Prepare my airport challenge code for review
- [x] Review my pair's airport challenge code

**Evidence**

- I have prepared my code for review, with a brief description of what the code does.
- I have reviewed my pair's code, making suggestions on improvements, and complementing what they have done well.


## Notes

### What is high quality code?

There isn't really a consensus, but generally, from the AGILE community's point of view, code is high quality when:
- it is easy to change
- it is easy to enhance

Customers are unlikely to look into your codebase, so they don't care directly about code quality, but they do care that you can implement new features and fix bugs quickly.

### Improving code

**Tools available to improve code:**

- Linters (like rubocop)
- Test tools (like RSpec)

However, these tools only check that the code is correct at a syntax level. There is still the potential for expectation mismatch and logical errors. The code may work, but it may not meet the requirements of the program.

This is where manual code review's by other devs can help. They can check code for you to see if it does what they had expected the program to do. In pair programming this review happens by the navigator as the code is written by the driver.

**Take care when reviewing code:**

- There may be differences in opinion between devs, in terms of style etc. So be careful not to bias your reviews.
- The reviewer may be thinking about the code differently, so they may misunderstand what the author was trying to do.
- Also, there is often some ego attachment to code, so criticising code harshly may cause upset.
- Don't "mark" code, make suggestions.

**Good code reviews:**

The best suggestions will persuade the author to make changes that improve the code.

[Additional notes](https://github.com/makersacademy/course/blob/master/how-to/code-review.md)

- Only suggest improvements like refactoring or additions to improve existing code rather than suggesting entirely new features.
- **Appreciations:** tell them what you like about the code.
- **Suggestions:** suggest things that would improve the code, like refactoring.
- **Respond:** after submitting comments, the author may ask questions, answer these, point to materials they can use, and if you don't know, say so.



### Pull Requests

GitHub uses Pull Requests for code reviewing.
- Add line comments to help the author improve their code
