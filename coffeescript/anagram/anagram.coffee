class Anagram
  constructor: (word) ->
    @word = word.toLowerCase()

  match: (words) ->
    original = @word
    words
      .join('~')
      .toLowerCase()
      .split('~')
      .filter (anagram) ->
        return Anagram.isAnagram original, anagram

   @isAnagram: (word, other) ->
     return false if word is other or word.length isnt other.length
     word  =  word.split('').sort().join()
     other = other.split('').sort().join()
     return word is other

module.exports = Anagram