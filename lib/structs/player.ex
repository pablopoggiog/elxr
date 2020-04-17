defmodule Truco.Player do
  @moduledoc """

  Player structure, it defines the layout of each player in the game. 

  Each player will have a name, a score (total score), a score_hand (score for the current hand), cards (in its hand), and a card_selected (the one chosen in current turn). 

  """
  defstruct cards: nil, name: nil, card_selected: nil
end
