# Debugging - Skills Workshop

[All Workshops](README.md) | [Source](https://github.com/makersacademy/skills-workshops/tree/master/week-1/debugging_1)

**Learning Objectives**

- [x] Learn a systematic approach to debugging

**Achievement Plan**

- [x] Attempt to debug the examples provided in the skills workshop
- [x] Follow the systematic approach described below to debug a program

**Evidence**

I have completed the first three the debugging examples

## Notes

### To debug, use a systematic approach

Tighten the loop
- Use error messages to find the line the bug is coming from.
- If that is in `rspec` results then check the rspec test and see what the test expects.
- Check up through the results to find the source.

Get visibility
- Use `p` to inspect things that you suspect lead up to the bug.

Single fix
- Once you have worked out the _one_ thing that is wrong, make the fix

**DO NOT** try things at random and see if that fixes the code.