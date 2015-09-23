class Phrase
  def initialize(sentence)
    @words = extract_words(sentence)
  end

  def word_count
    @words.each_with_object(Hash.new(0)){|word,counts| counts[word] += 1}
  end

  private

  def extract_words(sentence)
    sentence.downcase.scan(/[\w']+/)
  end
end