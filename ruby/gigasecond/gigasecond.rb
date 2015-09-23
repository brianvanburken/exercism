class Gigasecond

  SECONDS = 1000000000

  def initialize(date)
    @date = date.to_time
  end

  def date
    (@date + SECONDS).to_date
  end
end