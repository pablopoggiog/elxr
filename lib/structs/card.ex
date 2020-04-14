defmodule Truco.Card do
  @moduledoc """

  Structure that defines the layout of each card being used in the game.  
  Each card will have a name, and a magic number (the "power" of the card). 

  """
  defstruct name: nil, magic: nil
end
