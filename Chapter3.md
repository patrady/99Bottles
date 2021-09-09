# Chapter 3: Listening to Change

## 3.1 Listen to Change

> Spending time "improving" code based purely on aesthetics may not be the best use of your precious time

Really wonder what this statement means

> Conditionals are the bane of Object-Oriented Programming... Conditionals breed, and now that this one has started reproducing, you must do something to stop it.

## 3.2 Starting with the Open/Closed Principle

**Open/Closed** - open for extension and closed for modification. Code is open to a new requirement when you can meet that new requirement without changing existing code.

**_Sidebar: SOLID_**

- **S - Single Responsibility**: Class methods should revolve around a single purpose.

- **O - Open Closed**: Objects should be open for extension but closed for modfiication.

- **L - Liskov Substitution**: Subclasses should be substitutable for their superclasses. ??

- **I - Interface Segregation**: Objects should not be forced to depend on methods they don't use

- **D - Dependency Inversion**: Depend on abstractions, not on concretions.

> When faced with a new requirement, first rearrange the existing code such that it's open to a new feature, and once that's complete, then add the new code

## 3.3 Recognizing Code Smells

Uncle Bob has a great book called Refactoring and talks about several code smells that have steps to fix them

## 3.4 Identifying the Best Point of Attack

- Step 1: If you aren't clear on how to make the code open, make a list of code smells and start from there

  - Continue to remove code smells in hopes that the path to openness will be revealed

## 3.5 Refactoring Systematically

> Refactoring is the process of changing a software system in such a way that it does not alter the external behavior of the code yet improves its internal structure. - _Martin Fowler_

- **A safe refactor relies upon tests**

- If the tests begin to fail along the way it's either
  - You've broken the code
  - Or, the tests are flawed
    - A test that makes assertions about _how_ things are done, rather than _what_ actually happens, are the main contributor to this
    - Obviously, a test that tests the implementation of an inner method is going to fail if that method is refactored away

## 3.6 Following the Flocking Rules

- 1) Select the things that are most alike
- 2) Find the smallest difference between them
- 3) Make the simplist change that will remove that difference

AKA: Parse for Syntax-> Execute Change -> Use Result -> Delete Unused Code

## 3.7 Converging on Abstractions

If you apply the rules of refactoring, it converts difference to sameness and the underlying abstractions will follow

> Sometimes, hard problems are hard only because the easy ones haven't been solved yet

Try to refactor one line at a time and run the tests after each change

> The lengthy description above may have led you to fear that working in this fashion would be unbearably slow. "With practice, writing it becomes very fast"