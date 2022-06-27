defmodule LibraryFees do
  def datetime_from_string(string) do
    string
    |> NaiveDateTime.from_iso8601()
    |> elem(1)
  end

  def before_noon?(datetime), do: datetime.hour < 12

  def return_date(checkout_datetime) do
    days_to_add_in_seconds =
      if(before_noon?(checkout_datetime), do: 28, else: 29)
      |> days_to_seconds()

    checkout_datetime
    |> NaiveDateTime.add(days_to_add_in_seconds, :seconds)
    |> NaiveDateTime.to_date()
  end

  defp days_to_seconds(days), do: days * 24 * 60 * 60

  def days_late(planned_return_date, actual_return_datetime) do
    actual_return_datetime
    |> NaiveDateTime.to_date()
    |> Date.diff(planned_return_date)
    |> max(0)
  end

  def monday?(datetime) do
    datetime
    |> NaiveDateTime.to_date()
    |> Date.day_of_week()
    |> Kernel.==(1)
  end

  def calculate_late_fee(checkout, return, rate) do
    checkout_datetime = datetime_from_string(checkout)
    actual_return_datetime = datetime_from_string(return)

    checkout_datetime
    |> return_date()
    |> days_late(actual_return_datetime)
    |> Kernel.*(rate)
    |> Kernel.then(fn f ->
      if monday?(actual_return_datetime), do: div(f, 2), else: f
    end)
  end
end
