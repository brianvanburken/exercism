class Scrabble

  POINTS = {
    'a' => 1, 'e' => 1, 'i' => 1, 'o' => 1, 'u' => 1, 'n' => 1, 'l' => 1, 'r' => 1, 's' => 1, 't' => 1,
    'd' => 2, 'g' => 2,
    'b' => 3, 'c' => 3, 'm' => 3, 'p' => 3,
    'f' => 4, 'h' => 4, 'v' => 4, 'w' => 4, 'y' => 4,
    'k' => 5,
    'j' => 8, 'x' => 8,
    'q' => 10, 'z' => 10
  }

  def self.score(word)
    new(word).score
  end

  def initialize(word)
    @word = clean_up(word)
  end

  def score
    occurences(@word).inject(0) do |score, letter|
      score + POINTS[letter[0]] * letter[1]
    end
  end

  private

  def clean_up(word)
    word.nil? ? '' : word.strip.downcase
  end

  def occurences(word)
    word.chars.each_with_object(Hash.new(0)){|word,counts| counts[word] += 1}
  end

end