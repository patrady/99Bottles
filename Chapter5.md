# Chapter 5: Separating Responsibilities

## 5.1 Selecting the Target Code Smell

> "The refactoring recipes don't promise to result in code that better expressed the problem - they merely make it easy to create the new expression, and just as easy to rever it. Proper refactoring allows you to explore a problem domain safely.

```ruby
class Bottles
  def song
    verses(99,0)
  end

  def verses(upper, lower)
    upper.downto(lower).collect {|i| verse(i)}.join("\n")
  end

  def verse(number)
    "#{quantity(number).capitalize} #{container(number)} " + "of beer on the wall, " +
    "#{quantity(number)} #{container(number)} of beer.\n" + "#{action(number)}, " +
    "#{quantity(successor(number))} #{container(successor(number))} " +
    "of beer on the wall.\n"
  end

  def quantity(number)
    if number == 0
      "no more"
    else
      number.to_s
    end
  end

  def container(number)
    if number == 1
      "bottle"
    else
      "bottles"
    end
  end

  def action(number)
    if number == 0
    "Go to the store and buy some more"
    else
      "Take #{pronoun(number)} down and pass it around"
    end
  end

  def pronoun(number)
    if number == 1
      "it"
    else
      "one"
    end
  end

  def successor(number)
    if number == 0
      99
    else
      number - 1
    end
  end
end
```

Questions (Note: `quantity`, `container`, `action`, `pronoun`, and `successor` are known as _The Flocked Five_)

- _Question 1: Do any methods have the same shape?_

  - Yes, all of them which is a result of the flocking rules. If they were written differently (guard clause vs ternary vs if/else) then it would disguise their shape. Devs automatically assume that differences exist for a reason but they actually don't have to.

  - **Squint Test**: A code same-ness test conducted by squinting your eyes so you can no longer see the code but only the structure/color differences
    - Note that ternary clauses cause the structure to be muddled instead if you were to use `if` statements

- _Question 2: Do any methods take an argument of the same name?_

  - Yes, the flocked five

- _Question 3: Do arguments of the same name always mean the same thing?_

  - Different things: Verse Number vs # of Bottles

- _Question 4: If you were to add teh private keyword, where would it go?_

  - After `verse`

- _Question 5: If you were going to break this class into two pieces, where's the dividing line?_

  - After `verse`

- _Question 6: Do the tests in the condtiionals have anything in common?_

  - Yes, using the `==` instead of `<` or `>`

- _Question 7: How many branches do the conditionals have?_

  - 2

- _Question 8: Do the methods contain any code other than the conditional?_

  - No, which shows its fierce commitment to one responsibility

- _Question 9: Do methods that take `number` as an arg depend more on `number`, or more on the class as a whole?_

  - Just depend on `number`

## 5.1.4 Insisting Upon Messages

  Notice how all of the methods depend on `number`. This should be abstracted away into its own class. Another clue was that conditionals are very suspicious creatures in OOP.

  > When you see conditionals, you should feel entitles to send messages to objects and look for a way to write code that allows you to do so.

## 5.2 Extracting Classes

**Primitive Obsession**: when you use primitives (i.e. `string`, `int`, `array` or `hash`) to represent a concept in your domain. The cure is to create a new class in place of the primitive.

### 5.2.2 Naming Classes

Name things at one higher level of abstraction. AKA you should name _methods_ after what they _mean_ and _classes_ after what they _are_.

### 5.2.5 Trusting the Process

> "If you adhere to the recipe that Sandy outlines and tests start to fail, it's likely that you don't fully understand the problem yet"

Steps to remove parameters

  1) Alter the method definition to change the param name and provide a default

  2) Change every sender to remove the argument

  3) Delete the param from the method definition

> "The blessing of these techniques is that altering code in such small increments severely constrains the number of errors any change can introduce"

  - I agree with this but when working with large-scale projects, it can be INCREDIBLY time consuming to re-run the test suite after each change. Especially when that test suite takes > 20 minutes

## 5.3 Appreciating Immutability

If you're new to this concept you are probably concerned about performance (I definitely was at first). But, immutability makes objects easy to test, are thread safe

## 5.4 Assuming _Fast Enough_

It's hard for devs to accept immutability because it requires a mind-shift change and they have to overcome the sadness of creating new objects every time.

> "There are only two hard things in Computer Science: cache invalidation and naming things". - Phil Karlton

Moral of the story: Only resort to caching if you have to. There are plenty of other ways to speed up your code without resorting to caching. _If you require the speed increase, any cost is cheap. If you don't, every cost is too much._

## 5.5 Creating `BottleNumbers`

I like that she said it is often to finish horizontal refactoring (meaning finish the refactoring that you were doing) before going to fix a tangental vertical refactor. Write some shameless green code and then clean it up after the vertical refactor.

## 5.7 Summary

What I liked about this entire chapter is that by taking small incremental steps in refactoring, you can organize things in ways that didn't look apparent at first. For example, once the flocked five methods were created, you noticed that there was some primitive obsession happening with `number` being thrown all over the place. But only after using the flocking rules and realizing that were you able to extract that into a class and slowly refactor away into using it.
