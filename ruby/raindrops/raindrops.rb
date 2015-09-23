class Raindrops
  FACTORS = {3 => 'Pling', 5 => 'Plang', 7 => 'Plong'}

  def convert(number)
    drops = factors_to_string(number.factors)
    drops.empty? ? number.to_s : drops
  end

  private

  def factors_to_string(factors)
    factors.map {|n| FACTORS[n]}.compact.join
  end
end

class Integer
  def factors
    (1..self).select { |n| (self % n).zero? }
  end
end