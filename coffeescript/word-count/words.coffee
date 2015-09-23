class Words
  constructor: (phrase) ->
    @count = {}
    matches = phrase.toLowerCase().match(/\w+/gi)
    len = (matches.length - 1)
    while len >= 0
      word = matches[len]
      @count[word] = 0 if @count[word] is undefined
      @count[word]++
      len--

  count: ->
    @count

module.exports = Words