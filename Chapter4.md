f# Practicing Horizontal Refactoring

## 4.1 Replacing Difference with Sameness

Let's start by combinging the case 1 and _n_ verses together

You can change the first two phrases of the case 1 to be identical to the _n_ cases

```java
"1 bottle of beer on the wall, " +
"1 bottle of beer.\n" +
```

to

```java
"{number} {container(number)} of beer on the wall, " +
"{number} {container(number)} of beer.\n"
```

## 4.2 Equivocating About Names

Strategies for coming up with a variable name when naming is hard

1. Spend 5-10 minutes with a thesaurus in hand
2. Give it a meaningless name like `foo` or `namethis` and then come back to it once the code has revealed itself
3. Ask the _name guru_

In the case of making phrase 3 identical, `it` and `one` have a _good enough_ name of `pronoun`

This leads to changing

```java
"Take it down and pass it around, " +
```

```java
"Take one down and pass it around, " +
```

to

```java
"Take {pronoun(number)} down and pass it around, " +
```

## 4.3 Deriving Names From Responsibilities

- Naming things is hard so you make the best decision you can in the moment and reassess when you know more.

## 4.4 Choosing Meaningful Defaults

Honestly this section hurts my heart because it is overly complicated just to get to a spot where you write an if statement

## 4.5 Seeking Stable Landing Points

Following hte refactoring rules leads to consistent code and consistency matters deeply

## 4.6 Obeying the Liskov Substitution Principle

> When nibbling away at a problem, you don't have to understand everything before you can do anything. Taking care of the small things often cuts the big ones down to size.

It upset me when she said to resolve the `to_s` in the cases instead of the `quantity` method because personally I believe that a method shouldn't return two different types

> This inconsistency of return types forces the _sender_ of the message to know more than it should. Every piece of knowledge is a dependency, and the only way to fix that is to make the method more trustworthy i.e. for the _caller_ to have to know LESS.

**Liskov Substitution Principle**: requires that objects be what they promise they are. When using inheritance, a subclass should be fully substitutable for its parent superclass, _plus_ more.
- This also applies to _duck types_. Every object that asserts that it plays the duck's role must completely implement hte duck's API.
- Violations force message senders to have knowledge of the various return types and to treat them differently or convert them to be consistent

Guess I was right because I didn't know what the Liskov Substitution Principle was but I knew that it didn't feel right to return two different types from the same method

## 4.7 Taking Bigger Steps

It's easy to see that `"Go to the store and buy some more"` and `"Take #{pronoun(number)} down and pass it around"` are obviously different but it's cool that the author think this is just an abstraction that needs to be named. These are both actions so lets go with `action`.

```ruby
  def action(number)
    if number == 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun(number)} down and pass it around"
```

I feel called out by this statement:

> If you take bigger steps and the tests begin to fail, there’s something about the problem that you don’t understand. If this happens, don’t push forward and refactor under red. Undo, return to green, and make incremental changes until you regain clarity.

## 4.8 Discovering Deeper Abstractions

> Just because the tests pass doesn't mean that the abstraction is correct.

Clues that you made a wrong abstraction in 99 bottles:

  1) The newly abstracted method doesn't follow the trend of the others
  2) You are checking an invalid number of bottles

Instead, ask:
  1) What is the responsibility of the method that you are considering changing?
  2) Is there a way to make the phrases more alike, even if not yet identical?

> If a programmer had perfect understanding, they'd write perfect applications. But they're usually stumbling around in the dark, suffering from insufficient info, seeing problems through a glass, darkly.

It was genius to substitute 99 for `quantity(99)`

## 4.9 Depending on Abstractions

Great refactoring to cleanup the `number - 1` with `successor(number)`!

Surprisingly the metrics got worse once the refactoring was done compared to Shameless Green! Despite the complexity score, the code _is_ better. An improvement has been made that is invisible to static analysis tools. What's important is that you have identified the domain objects that create the verses.

## 4.10 Closing Statement

> If several different programmers started from Shameless Green and refactored the `verse` method according to the Flocking Rules, the end code would be identical except for the method names. This has enormous value and in my opinion is debateable whether this is actually correct