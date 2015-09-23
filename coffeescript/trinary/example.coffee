class Trinary
  @BASE = 3

  constructor: (trinary) ->
    @digits = trinary.split('').reverse().map(Number)

  toDecimal: ->
    decimal = @digits.reduce(this.accumulator, 0)
    return 0 if isNaN decimal
    decimal

  accumulator: (decimal, digit, index) ->
    return decimal += digit * Math.pow(Trinary.BASE, index)
 
 module.exports = Trinary