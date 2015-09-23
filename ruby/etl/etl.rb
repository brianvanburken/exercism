class ETL
  def self.transform(old)
    new = Hash.new
    old.each_pair do |points, letters|
      letters.each{|letter| new[letter.downcase] = points}
    end
    new
  end
end