# Wordy

Write a program that takes a word problem and returns the answer as an integer.

## Step 1

E.g.

> What is 5 plus 13?

The program should handle large numbers and negative numbers.

Remember, that these are verbal word problems, not treated as you
normally would treat a written problem.  This means that you calculate
as you move forward each step.  In other words, you should ignore order
of operations.  3 + 2 * 3 = 15, not 9.

Use the tests to drive your solution by deleting the `skip` in one test
at a time.

## Step 2

E.g.

> What is 5 plus 13?

> What is 7 minus 5?

> What is 6 multiplied by 4?

> What is 25 divided by 5?

## Step 3

E.g.

> What is 5 plus 13 plus 6?

> What is 7 minus 5 minus 1?

> What is 9 minus 3 plus 5?

> What is 3 plus 5 minus 8?

## Step 4

E.g.

> What is 5 plus 13?

> What is 7 minus 5?

> What is 6 times 4?

> What is 25 divided by 5?

> What is 78 plus 5 minus 3?

> What is 18 times 3 plus 16?

> What is 4 times 3 divided by 6?

> What is 4 plus 3 times 2?

## Extensions

Implement questions of the type:

> What is 2 raised to the 5th power?

Remember to write failing tests for this code.

## Running tests

Execute the tests with:

```bash
$ elixir bob_test.exs
```

(Replace `bob_test.exs` with the name of the test file.)


### Pending tests

In the test suites, all but the first test have been skipped.

Once you get a test passing, you can unskip the next one by
commenting out the relevant `@tag :pending` with a `#` symbol.

For example:

```elixir
# @tag :pending
test "shouting" do
  assert Bob.hey("WATCH OUT!") == "Whoa, chill out!"
end
```

Or, you can enable all the tests by commenting out the
`ExUnit.configure` line in the test suite.

```elixir
# ExUnit.configure exclude: :pending, trace: true
```

For more detailed information about the Elixir track, please
see the [help page](http://exercism.io/languages/elixir).

## Source

Inspired by one of the generated questions in the Extreme Startup game. [https://github.com/rchatley/extreme_startup](https://github.com/rchatley/extreme_startup)

## Submitting Incomplete Problems
It's possible to submit an incomplete solution so you can see how others have completed the exercise.

