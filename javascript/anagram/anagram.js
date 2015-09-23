module.exports = function(word) {

  function alphabetize(word) {
    return word.toLowerCase().split('').sort().join('');
  }

  return {
    matches: function(wordList) {
      if (typeof wordList === 'string') {
        wordList = [].slice.apply(arguments);
      }
      return wordList.filter(function (comparingWord) {
        return word !== comparingWord.toLowerCase() &&
          alphabetize(word) === alphabetize(comparingWord);
      });
    }
  };
};
