class SpaceAge
  attr_reader :seconds

  SECONDS_PER_EARTH_YEAR = 31_557_600.00
  EARTH_YEAR_RATIO = {
    earth:     1.00000000,
    mercury:   0.24084670,
    venus:     0.61519726,
    mars:      1.88081580,
    jupiter:  11.8626150,
    saturn:   29.447498,
    uranus:   84.016846,
    neptune: 164.79132
  }

  def initialize(seconds)
    @seconds = seconds
  end

  EARTH_YEAR_RATIO.each do |planet, ratio|
    define_method("on_#{planet}") do
     (earth_years / ratio).round(2)
    end
  end
  
  private  

  def earth_years
    @seconds / SECONDS_PER_EARTH_YEAR
  end

end