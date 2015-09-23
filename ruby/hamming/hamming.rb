class Hamming
  def self.compute(a, b)
    shortest = (a.length > b.length ? b : a)
    count = 0
    shortest.chars.each_index {|i| count += 1 unless a[i] == b[i]}
    count
  end
end