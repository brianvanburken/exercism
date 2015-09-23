class Hexidecimal
  @VALUES = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F']
  @BASE = 16

  constructor: (hex) ->
    @chars = hex.toUpperCase().split('').reverse()

  toDecimal: ->
    return 0 unless Hexidecimal.isValid @chars.join('')
    @chars.reduce(this.accumulator, 0)

  @isValid: (hex) ->
    /^[a-f0-9]+$/i.test hex

  accumulator: (sum, hex, index) ->
    return sum += Hexidecimal.VALUES.indexOf(hex) * Hexidecimal.BASE ** index

module.exports = Hexidecimal