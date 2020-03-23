# Code Review - Skills Workshop

[All Workshops](README.md) | [Skills Workshop Source](https://github.com/makersacademy/skills-workshops/tree/master/week-2/code_review)

**Learning Objectives**

- [ ] Describe high quality code
- [ ] Explain why dev teams do code reviews
- [ ] Use a GitHub pull request to review someone else's code

**Achievement Plan**

- [ ] Review airport weekend challenges in pairs
- [ ] 

**Evidence**



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
- The reviewer may be thinking about the code differently, so they may misunderstand what the writer was trying to do.
- Also, there is often some ego attachment to code, so criticising code harshly may cause upset.
- Don't "mark" code, make suggestions.
- The best suggestions will persuade the writer to make changes that improve the code



### Pull Requests

GitHub uses Pull Requests
