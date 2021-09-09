# Chapter 2: Test Driving Shmeless Green

## 2.1 Understanding Testing

Test Driven Development
Step 1) _Write a test_: The test should fail and be red
Step 2) _Make it run_: Get the test to pass and turn green
Step 3) _Make it right_: Refactor and the tests should continue to pass

# 2.2 Writing the First Test

It may seem pointless to write obviously temporary and transitional code at first, but this is the essenece of TDD

I don't think I would be as patient as it is asking me to be on page 28

> The difference between the solution that adds conditional logic vs a variable is that as tests get more specific, the code stays equally specific. But that shouldn't be the case

# 2.4 Tolerating Duplication

**Red Herring**: Something that misleads or distracts from an important issue

The pluralize method is an example of a Red Herring. This is when DRY is taken to an extreme to avoid duplication. Before doing this ask:
- _Does hte change I'm contemplating make the code harder to understand?_
- _What is the future cost of doing nothing now?_
- _When will the future arrive or how soon will I get more information?_

We have a bad habit of coding for a future that may never come

Tolerate duplication to know what you should abstract based on business requirements

# 2.5 Hewing to the Plan

Be patient.

Maximize your understanding of the problem and unearth all available information before committing to abstractions.

# 2.6 Exposing Responsibilities

Make sure a method does what it is intended to do

# 2.7 Revealing Intentions

> The distinction between intention and implementation allows you to understand a computation first in essense and later, if necessary, in detail. - Kent Beck

# 2.9 Writing Cost-Effective Tests

> Despite this general agreement, the sad truth is that the promise of TDD has not been universally fulfilled. Many applications have tests that are difficult to understand, challenging to change, and prohibitively time-consuming to run. Instead of enabling change, these tests actively impede it. The world is littered with test suites that are roundly hated by their maintainers, sometimes to the point of abandonment.

