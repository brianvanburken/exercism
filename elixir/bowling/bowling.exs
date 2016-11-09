defmodule Bowling do
  defstruct rolls: [], score: 0, roll_number: 1, finished: false

  @doc """
    Creates a new game of bowling that can be used to store the results of
    the game
  """

  @spec start() :: any
  def start, do: %Bowling{}

  @doc """
    Records the number of pins knocked down on a single roll. Returns `:ok`
    unless there is something wrong with the given number of pins, in which
    case it returns a helpful message.
  """

  @spec roll(any, integer) :: any | String.t
  def roll(_, roll) when roll <  0, do: {:error, "Pins must have a value from 0 to 10"}
  def roll(_, roll) when roll > 10, do: {:error, "Pins must have a value from 0 to 10"}

  def roll(%Bowling{roll_number: 9} = game, 10) do
    %Bowling{game | rolls: [10], roll_number: game.roll_number - 1}
  end

  def roll(%Bowling{rolls: [first], roll_number: 10} = game, roll) when roll + first == 10 do
    %Bowling{game | rolls: [], score: game.score + roll + first, finished: true}
  end

  def roll(%Bowling{rolls: [], roll_number: 10} = game, roll) do
    %Bowling{game | score: game.score + roll, finished: true}
  end

  def roll(%Bowling{rolls: [previous]} = game, roll) when roll + previous > 10 and previous != 10 do
    {:error, "Pin count exceeds pins on the lane"}
  end

  def roll(%Bowling{rolls: [first], roll_number: 10} = game, roll) do
    %Bowling{game | rolls: [roll], score: game.score + first + roll, finished: true}
  end

  def roll(%Bowling{rolls: [second, 10]} = game, roll) do
    %Bowling{game | rolls: [roll, second], score: game.score + 10 + second + roll, finished: true}
  end

  def roll(%Bowling{rolls: [second, first]} = game, roll) when first + second == 10 do
    %Bowling{game | rolls: [roll], roll_number: game.roll_number + 1, score: game.score + first + second + roll}
  end

  def roll(%Bowling{rolls: [second, first]} = game, roll) do
    %Bowling{game | rolls: [roll], roll_number: game.roll_number + 1, score: game.score + first + second}
  end

  def roll(game, roll), do: %Bowling{game | rolls: [roll | game.rolls]}

  @doc """
    Returns the score of a given game of bowling if the game is complete.
    If the game isn't complete, it returns a helpful message.
  """

  @spec score(any) :: integer | String.t
  def score(%Bowling{finished: false}), do: {:error, "Score cannot be taken until the end of the game"}
  def score(%Bowling{finished: true, score: score} = game), do: score
end
