class Bob
  def hey(greeting)
    greeting = Greeting.new(greeting)
    return "Woah, chill out!" if greeting.yell?
    return "Sure." if greeting.question?
    return "Fine. Be that way!" if greeting.mute?
    "Whatever."
  end
end

class Greeting

  def initialize(greeting)
    @greeting = greeting
  end

  def yell?
    uppercase? && contains_letters?
  end

  def mute?
    @greeting.strip.empty?
  end

  def question?
    @greeting.end_with? '?'
  end


  private

  def contains_letters?
    @greeting =~ /[a-z]/i
  end

  def uppercase?
    @greeting == @greeting.upcase
  end
end