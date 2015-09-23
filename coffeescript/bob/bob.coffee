class Greeting
  
  constructor: (greeting) ->
    @greeting = greeting.trim()
  
  yell: ->
    @greeting is @greeting.toUpperCase()

  mute: ->
    not @greeting
  
  question: ->
    @greeting[@greeting.length-1] is '?'

class Bob
  
  hey: (greeting) ->
    greeting = new Greeting greeting
    return "Fine. Be that way!" if greeting.mute()
    return "Woah, chill out!" if greeting.yell()
    return "Sure." if greeting.question()
    "Whatever."

module.exports = Bob