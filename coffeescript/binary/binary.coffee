class Binary
  @BASE = 2

  constructor: (binary) ->
    @digits = binary.split('').reverse().map(Number)

  toDecimal: ->
    decimal = @digits.reduce(this.accumulator, 0)
    return 0 if isNaN decimal
    decimal

  accumulator: (decimal, digit, index) ->
    return decimal += digit * Math.pow(Binary.BASE, index)
 
 module.exports = Binary