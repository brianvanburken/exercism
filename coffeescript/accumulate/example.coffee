Array::accumulate = (accumulator) ->
    argument = undefined
    argument = arguments[1] if arguments.length >= 2
    for item, i in this
      accumulator.call(argument, item, i, this)