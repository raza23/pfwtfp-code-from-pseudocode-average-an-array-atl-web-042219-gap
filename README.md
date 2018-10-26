# Code From Pseudocode: Average an Array

## Learning Goals

- Create Code from Pseudocode

## Introduction

You've now had a chance to practice creating pseudocode on your own. Let's
convert that pseudocode into actual Ruby code. You should have your pseudocode
nearby.  We'll show you _our_ pseudocode and you can compare your process to
ours.

### Our Pseudocode

Here's what our pseudocode looks like:

```text
### Identify the problem

We want to find the arithmetic average.

### Identify the output that would solve the problem

Using the definition of average, calculate the mean defined as the sum of the
inputs divided by their count

### Name the procedure that fixes the problem

`average_collection_of_numbers`

### Identify what inputs are needed to create the output

* Array of numbers
* Count of the numbers

### Define the procedure’s implementation

  local var: running total
  local var: count
  For each element
    accumulate its value to running total AND
    add a tick to count
  return running total / count
```

## Create Code from Pseudocode

### Steps 1 and 2

Let's get started. The first two activities of the Flatiron Process are not
going to be much help to us in this part of development: "Identify the Problem"
and "Identify the Output." These two steps are used to make sure we're solving
the right problem. They will actually be used at the end, _after_ coding, to
make sure we coded the right _Procedure_ and that it does what we planned.
We'll check on them at the end.

### Step 3: Name the _Procedure_

We **do** however, want to pick up with "Step 3: Name the _Procedure_." In our
code buffer, we'll define the method as Ruby requires:

```ruby
def average_collection_of_numbers
end
```

### Step 4: Identify What Inputs are Needed

Our pseudocode suggests:

- Array of numbers
- Count of the numbers

So our Ruby code should look like:


```ruby
def average_collection_of_numbers(array_of_numbers, number_count)
end
```

However this is not typical Ruby style. It's a bit over-verbose. Most
Ruby developers would expect this to be written closer to the following:

```ruby
def average_numbers(collection)
  collection_count = collection.count
end
```

Some taste and experience decisions are shown in here, so we'll touch on them
briefly.

#### Why not `array_of_numbers`?

We said in our pseudocode that we needed a collection, or `Array` of numbers.
Why not reflect that in the name of the input?

It's a good question. In some languages we would have so specify that the
input was an `Array` of `Integer` or `Float`. Ruby doesn't require that
from us ([future versions might][ts ruby]). Ruby doesn't require this and a
great host of bugs have arisen because of it. Many smart people have come to
think that *not* requiring us to specify what type we expected has been a Bad
Idea.

[ts ruby]: http://codon.com/consider-static-typing

Given all that, why wouldn't we document, in the most visible possible way,
that we expect an `array_of_numbers`? Well, it's simply not the style in which
Ruby is written. Ruby style suggests that when you add an `s` which makes a
variable name plural, you're signaling to readers that you mean to take a
collection of some sort (usually an `Array`) and _that_ is sufficient. When
translating pseudocode, you'll need to keep in mind the language's community's
standards of practice. Honor the conventions of the community, when possible.

We can restructure the name of the method and the arguments to
contain essentially the same information, but less verbosely:


```ruby
def average_numbers(collection)
```

#### Why Did you Drop the `number_count`

While pseudocoding, it helps to know that our method depends on knowing on the
count of numbers in our collection. However, this _particular_ programming language, Ruby,
has an awesome built-in command for finding the number of members in an
`Array` called `count`. Is there any way that the information we expect to
be passed in would be _different_ from what Ruby calculated? The answer is
clearly "no." So, we can _hide_ that complexity.

From:

```ruby
collection = [1,2,3]
collection_length = collection.count
average_numbers(collection, collection_length)
```

to:

```ruby
collection = [1,2,3]
average_numbers(collection)
```

Other users of your code appreciate having to do the least amount of work
possible. When you can calculate information for them, do so.

### Step 5: Define the _Procedure_

The final step, which, dangerously, is where many coders leap to _first_, is
the implementation. Let's take the pseudocode and put it inside of our method
that's under progress.

```ruby
def average_numbers(collection)
  collection_count = collection.count
#      local var: running total
#      local var: count
#      For each element
#        accumulate its value to running total AND
#        add a tick to count
#      return running total / count
end
```

First, we'll translate the local variable `running_total`. Next, we'll
drop the local variable `count` because that's been calculated already. We can
also remove the pseudocode line where we add to `count`.

```ruby
def average_numbers(collection)
  collection_count = collection.count
  running_total = 0
#      For each element
#        accumulate its value to running total
#      return running total / count
end
```

Next, let's uncomment our `return` statement. Ruby automatically "returns" the
last line of code, so it's unusual to see the `return` word beginning the last line
of a method in Ruby. The code would look like this.

```ruby
def average_numbers(collection)
  collection_count = collection.count
  running_total = 0
#      For each element
#        accumulate its value to running total 
  running total / count
end
```

Ruby has a vast array (no pun intended) of tools for looping and iteration.
We're going to use a very simple one called `upto`. Since we have the
`collection_count`, let's iterate from 0 to the `count - 1`.

```ruby
def average_numbers(collection)
  collection_count = collection.count
  running_total = 0
  0.upto(collection.count - 1) do |i|
    running_total += collection[i]
  end
  running_total / collection_count
end
```

### Verify the Code!

Test the code with `collection` set to `[1,2,3]` and prove to yourself that our code works!

Double check the work we did in Steps 1 and 2:

```text
### Identify the problem

We want to find the arithmetic average.

### Identify the output that would solve the problem

Using the definition of average, calculate the mean defined as the sum of the
inputs divided by their count
```

If the code meets the "problem" the code "works." Good job!

### Lab

...But the code is _still_ not yet done. If we test our method with a few more
complicated inputs, some things go wrong. Even the best pseudocoding might
_still_ not catch all of the error cases! Fortunately, with clearly written,
well-pseudocoded code and a debugging methodology like the Triangle process,
we can take care of this work in no time.

We've given you the code above as a starting point. Add the provided code into
`lib/average.rb`. Use the `learn` command to find out what's still broken. Then
use the Triangle Process to isolate the bugs. Fix the code, get the tests
passing, and move on!

## Conclusion

This lesson represents the end of a lot of work trying to be more focused and
mindful of how we create our methods. This process, when followed carefully,
will help you consistently generate good code: code that is readable and code
that produces the correct output.

By fusing pieces of good code with other pieces of good code, we can tackle
daunting problems with code that isn't painful to work with. Good work! Be sure
to use a process like this as you tackle more advanced problems. Averaging a
collection is a well-understood and well-defined problem. Other problems like
`show_video_that_matches_search_request` is a lot harder, **but** crumbles
before dedicated use of our process.
