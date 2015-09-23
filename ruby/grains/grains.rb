class Grains

  MAX_SQUARES = 64

  def square(number)
    2**(number - 1)
  end

  def total
    (1..MAX_SQUARES).map(&method(:square)).inject(:+)
  end
end