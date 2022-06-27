defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]

  def new(nickname \\ "none")
  def new(nickname), do: %RemoteControlCar{nickname: nickname}

  def display_distance(%RemoteControlCar{} = remote_car),
    do: "#{remote_car.distance_driven_in_meters} meters"

  def display_battery(%RemoteControlCar{} = remote_car) do
    "Battery " <>
      if remote_car.battery_percentage == 0,
        do: "empty",
        else: "at #{remote_car.battery_percentage}%"
  end

  def drive(%RemoteControlCar{battery_percentage: 0} = remote_car),
    do: remote_car

  def drive(%RemoteControlCar{} = remote_car) do
    remote_car
    |> Map.update!(:battery_percentage, &(&1 - 1))
    |> Map.update!(:distance_driven_in_meters, &(&1 + 20))
  end
end
