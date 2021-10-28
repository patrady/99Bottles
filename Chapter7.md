## 7.1 Manufacturing Intelligence

> Factories don't know what to do: instead, they know how to choose who does

## 7.2 Fathoming Factories

> Factories are where conditionals go to die

## 7.3 Opening the Factory

`const_get("BottleNumber#{number}")`

NOOOOO PLZ NO MORE METAPROGRAMMING

Benefits to this way of implementing a factory

  1. It is open to extension as long as you follow the naming convention

Downfalls

  1. This version is much harder to understand

  2. Can't tell if this class is being referenced

  3. The code uses an exception for flow control

  4. The factory ignores bottle number classes whose names do not follow the convention

The route taken depends on how often the code is changing

## 7.4 Supporting Arbitrary Class Names

When you can't use a factory that automatically creates the class names programmatically, you can use a switch statement but that isn't open to extension. You can instead use a hash that maps numbers to classes.

In a factory, it is preferrable to use the Hash syntax instead of the `fetch` syntax:

```ruby
Hash.new(BottleNumber).merge( ... )
```

vs

```ruby
{ ... }.fetch(bottle_number, BottleNumber)
```

because it is more "apparent" when the default is upfront compared to the end

The nice thing about having it as a hash instead of a switch/case statement is that it is now its own entity and can be saved to its own file and read at runtime (if desired).

> "When the colors change constantly it means that the code changes _topics_ a lot. When the colors are mor etightly grouped it means that ideas or abstractions that are alike are close together.

> The upside of procedures is that simple ones (short and w/o conditionals) are easy to understand. The downside is that complex ones (long and with many conditionals) are costly to change.

## 7.5 Dispersing the Choosing Logic

Sometimes factories are so simple that the choosing logic belongs in the factory method but sometimes sometimes it's not that straightforward.

If the choosing logic is long, complex and related to the class then it needs to go in the class itself.

## 7.6 Self-registering Candidates

If we want the factory to always be open, we can:
  1) Dynamically figure out which classes it should use
  2) Somehow have the class register itself with the factory

Option 1 isn't always possible but option 2 is!

Here's how:

  Add a registry:

  ```ruby
    def self.registry
      @registry ||= []
    end
  ```

  Have the class register itself: `BottleNumber.register(self)`

## 7.7 Auto-registering Candidates

Use the `inherited` hook as long as all of the classes are inhering from one class