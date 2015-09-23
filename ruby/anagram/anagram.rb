class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(words)
    words.select {|word| anagram? word.downcase}
  end

  private

  def anagram?(word)
    return false if word == @word
    word.chars.sort == @word.chars.sort
  end

end