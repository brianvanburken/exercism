module.exports = function(string) {
  var wordList = Object.create(null),
      words = string.trim().split(/\s+/);
  for(var i = 0; i < words.length; ++i) {
    wordList[words[i]] = wordList[words[i]] + 1 || 1;
  }
  return wordList;
};
