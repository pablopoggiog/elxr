defmodule Truco do
  @moduledoc """
  Truco is a game developed in Elixir, as a TP for a class.  
  It has several branches, this is the latest one.
  """

  alias Truco.Game
  alias Truco.Turn

  @doc """
  This function starts a new complete turn, each with its corresponding 3 hands. 
  If its called without parameters (starting the game), applies the first function, and at Game.create_players() is created a list of players. 
  If its called with a list of teams, because the game is already running, will be called the second definition. 
  """

  def play do
    IO.puts("\nBienvenido a Truco")

    Game.create_players()
    |> Game.create_deck()
    |> Game.shuffle()
    |> Game.deal()
    |> Turn.play_hand()
  end

  def play([team_1, team_2]) do
    Game.create_deck([team_1, team_2])
    |> Game.shuffle()
    |> Game.deal()
    |> Turn.play_hand()
  end
end
