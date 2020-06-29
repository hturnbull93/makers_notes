# Reviews

[Back to Course Goals](README.md) | [Source](https://docs.google.com/document/d/1EgbszeKZ1JZGwy_uWxRJE1zeiedQ9oBhfdkau2Z34OU)

Reviews are an opportunity to practice , and to feedback on your coding processes.

Reviews are a technical assessment simulating a technical interview.

The reviewer roleplays as a product owner with a set of non-technical requirements. The developer uses the Makers dev process to convert these requirements into a working, tested, well-written application.

The Review assesses how well a developer:

- Converts fuzzy, human wants and needs into technical requirements.
- Writes good tests.
- Writes clean code.
- Debugs when things go wrong.
- Delivers value to the customer in an Agile way.

## Process

Use the same process as the [Process Workshops](/process_workshops.md).

## 6 May

[Full Feedback](/reviews/2020-05-06-feedback.pdf) | [Recording](https://www.youtube.com/watch?v=rLyvq_DT1-w)

Feedback Summary:

- Increment on previous code in TDD, rather than rewriting a new solution to satisfy all tests.

## 21 May

[Full Feedback](/reviews/2020-05-21-feedback.pdf) | [Recording](https://www.youtube.com/watch?v=iNVmJmZIxfs)

Feedback Summary:

- Think of the general case (the simplest thing someone would actually do).
- In this example, a single array:
  - [0], low of 1 and high of 2.
  - [1], low of 1 and high of 2.
  - [2], low of 1 and high of 2.
  - [3], low of 1 and high of 2.
- Avoid specific cases until later.

## 12 June

[Full Feedback](/reviews/2020-06-12-feedback.pdf) | [Recording](https://www.youtube.com/watch?v=HDtL4z3_niE)

Feedback Summary:

- Split refactor into two steps: one to address the interpolation, another to use the array.
- Always test for behaviour, not for implementation (so don't check that it uses `File.open`, as this could change later perhaps).
- Always start commit messages with a capital letter.
- Method names always verbs.

## 29 June

[Full Feedback](/reviews/2020-06-29-feedback.pdf) | [Recording]()

Feedback Summary:

- I used an Inside Out testing approach, which is to focus on a particular feature in all its detail (all addition for example).
- Consider using an Outside In testing approach instead.
- More horizontal, deal with similar levels of behaviour for each feature, this forces you to separate out the interactions between cases early on, less likely to need to undo refactored code from going too far down one direction.
- Remember to vocalise and explain processes. Important for technical interviews for people to understand the thought process.
