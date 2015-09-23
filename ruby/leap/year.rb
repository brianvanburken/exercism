class Year
  def self.leap?(year)
    if year % 4 == 0
      return true unless year % 100 == 0 and not year % 400 == 0
    end
    false
  end
end