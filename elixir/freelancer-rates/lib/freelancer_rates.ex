defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    before_discount - before_discount * (discount / 100.0)
  end

  def monthly_rate(hourly_rate, discount) do
    hourly_rate
    |> daily_rate()
    |> Kernel.*(22.0)
    |> apply_discount(discount)
    |> Float.ceil()
    |> trunc()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    daily_rate_after_discount =
      hourly_rate
      |> daily_rate()
      |> apply_discount(discount)

    (budget / daily_rate_after_discount)
    |> Float.floor(1)
  end
end
