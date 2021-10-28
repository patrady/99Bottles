# Chapter 6: Achieving Openness

I'm excited, we get to add a factory pattern!

## 6.1 Consolidating Data Clumps

**Data Clump Code Smell**: the situation in which several (>3) data fields are routinely grouped together

- The presence of this code smells means that you are missing a concept. The code can get muddy, duplicated and accidentally mismanaged if not careful

- The value of removing data clumps is great

In the case of 99 bottles, notice how `quantity` and `container` are always grouped together? That's an example of a data clump. Move these two to their own method and call them correspondingly

## 6.2 Making Sense of Conditionals

Switch cases are sometimes a code smell and their refactoring recipes are

1. _Replace Conditional with State/Strategy_

   Removes conditionals by dispering their branches into new, smaller objects, one of which is selected and plugged back in at runtime. _Doesn't use inheritance_

2. _Replace Conditional with Polymorphism_

  Removes conditionals by creating one class to hold the default of the conditionals (false branches) and adding subclasses for each specialization (true branches). It chooses one of the objects to plug back in at runtime. _Uses inheritance_

> The best way to figure out which refactoring recipe is right is to try them all, evaluate, pick one and go with it. Practice builds intuition

## 6.3 Replacing Conditionals with Polymorphism

Extracts the primitive obsession with `1` and `0` into their own `BottleNumber0` class and a default class. Moves the logic for deciding which class to return into a factory.

## 6.4 Transitioning Between Types

## 6.5 

## 6.6 Defending the Domain

> Clever shortcuts are a false economy. Invest in code that tells the truth.