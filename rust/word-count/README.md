# Word Count

Welcome to Word Count on Exercism's Rust Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Given a phrase, count the occurrences of each _word_ in that phrase.

For the purposes of this exercise you can expect that a _word_ will always be one of:

1. A _number_ composed of one or more ASCII digits (i.e. "0" or "1234") OR
2. A _simple word_ composed of one or more ASCII letters (i.e. "a" or "they") OR
3. A _contraction_ of two _simple words_ joined by a single apostrophe (i.e. "it's" or "they're")

When counting words you can assume the following rules:

1. The count is _case insensitive_ (i.e. "You", "you", and "YOU" are 3 uses of the same word)
2. The count is _unordered_; the tests will ignore how words and counts are ordered
3. Other than the apostrophe in a _contraction_ all forms of _punctuation_ are ignored
4. The words can be separated by _any_ form of whitespace (i.e. "\t", "\n", " "), or
   external punctuation.

For example, for the phrase `"That's the password: 'PASSWORD 123'!", cried the Special Agent.\nSo I fled.` the count would be:

```text
that's: 1
the: 2
password: 2
123: 1
cried: 1
special: 1
agent: 1
so: 1
i: 1
fled: 1
```

For the phrase `"one,two,three"` the count would be:

```text
one: 1
two: 1
three: 1
```

## Source

### Created by

- @EduardoBautista

### Contributed to by

- @andrewclarkson
- @ashleygwilliams
- @AvasDream
- @ClashTheBunny
- @coriolinus
- @cwhakes
- @EduardoBautista
- @efx
- @ErikSchierboom
- @IanWhitney
- @ijanos
- @jonmcalder
- @kytrinyx
- @lutostag
- @mkantor
- @navossoc
- @nfiles
- @petertseng
- @pminten
- @rofrol
- @stringparser
- @xakon
- @yawpitch
- @ZapAnton

### Based on

This is a classic toy problem, but we were reminded of it by seeing it in the Go Tour.