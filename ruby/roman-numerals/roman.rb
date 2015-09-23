class Fixnum
  
  def to_roman
    i = self
    s = ''
    ROMAN_MAPPING.each do |roman, arabic|
      while i >= arabic
        s << roman.to_s.upcase
        i -= arabic
      end
    end
    s
  end

  private

  ROMAN_MAPPING = {
    m:  1000,
    cm: 900,
    d:  500,
    cd: 400,
    c:  100,
    xc: 90,
    l:  50,
    xl: 40,
    x:  10,
    ix: 9,
    v:  5,
    iv: 4,
    i:  1
  }
end