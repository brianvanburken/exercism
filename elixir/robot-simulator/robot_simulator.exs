defmodule RobotSimulator do
  defstruct direction: nil, position: nil

  @directions [:north, :east, :south, :west]

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: { integer, integer }) :: any
  def create(direction \\ :north, position \\ {0, 0})
  def create(direction, {x, y} = position) when is_integer(x) and is_integer(y) and direction in @directions do
    %RobotSimulator{direction: direction, position: position}
  end
  def create(_, {x, y}) when is_integer(x) and is_integer(y), do: {:error, "invalid direction"}
  def create(_, _), do: {:error, "invalid position"}

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t ) :: any
  def simulate(robot, ""), do: robot

  def simulate(%RobotSimulator{direction: :north, position: {x, y}} = robot, "A" <> rest), do: simulate(%RobotSimulator{robot | position: {x, y+1}}, rest)
  def simulate(%RobotSimulator{direction: :east,  position: {x, y}} = robot, "A" <> rest), do: simulate(%RobotSimulator{robot | position: {x+1, y}}, rest)
  def simulate(%RobotSimulator{direction: :south, position: {x, y}} = robot, "A" <> rest), do: simulate(%RobotSimulator{robot | position: {x, y-1}}, rest)
  def simulate(%RobotSimulator{direction: :west,  position: {x, y}} = robot, "A" <> rest), do: simulate(%RobotSimulator{robot | position: {x-1, y}}, rest)

  def simulate(%RobotSimulator{direction: :north} = robot, "L" <> rest), do: simulate(%RobotSimulator{robot | direction: :west }, rest)
  def simulate(%RobotSimulator{direction: :east } = robot, "L" <> rest), do: simulate(%RobotSimulator{robot | direction: :north}, rest)
  def simulate(%RobotSimulator{direction: :south} = robot, "L" <> rest), do: simulate(%RobotSimulator{robot | direction: :east }, rest)
  def simulate(%RobotSimulator{direction: :west } = robot, "L" <> rest), do: simulate(%RobotSimulator{robot | direction: :south}, rest)

  def simulate(%RobotSimulator{direction: :north} = robot, "R" <> rest), do: simulate(%RobotSimulator{robot | direction: :east }, rest)
  def simulate(%RobotSimulator{direction: :east } = robot, "R" <> rest), do: simulate(%RobotSimulator{robot | direction: :south}, rest)
  def simulate(%RobotSimulator{direction: :south} = robot, "R" <> rest), do: simulate(%RobotSimulator{robot | direction: :west }, rest)
  def simulate(%RobotSimulator{direction: :west } = robot, "R" <> rest), do: simulate(%RobotSimulator{robot | direction: :north}, rest)

  def simulate(_, _), do: {:error, "invalid instruction"}

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(%RobotSimulator{direction: direction}), do: direction

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: { integer, integer }
  def position(%RobotSimulator{position: position}), do: position
end
