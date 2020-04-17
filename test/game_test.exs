defmodule GameTest do
  use ExUnit.Case
  doctest Truco.Game
  import Truco.Game
  alias Truco.Card
  alias Truco.Player
  alias Truco.Team

  @players_2 [%Team{players: [%Player{name: 'Player 1'}]}, %Team{players: [%Player{name: 'PC'}]}]
  @players_4 [
    %Team{players: [%Player{name: 'Player 1'}, %Player{name: 'Player 2'}]},
    %Team{players: [%Player{name: "PC"}, %Player{name: "PC-2"}]}
  ]

  @deck [
    %Card{name: "1 de Espada", magic: 13},
    %Card{name: "2 de Espada", magic: 8},
    %Card{name: "3 de Espada", magic: 9},
    %Card{name: "4 de Espada", magic: 0},
    %Card{name: "5 de Espada", magic: 1},
    %Card{name: "6 de Espada", magic: 2},
    %Card{name: "7 de Espada", magic: 11},
    %Card{name: "10 de Espada", magic: 4},
    %Card{name: "11 de Espada", magic: 5},
    %Card{name: "12 de Espada", magic: 6},
    %Card{name: "1 de Copa", magic: 7},
    %Card{name: "2 de Copa", magic: 8},
    %Card{name: "3 de Copa", magic: 9},
    %Card{name: "4 de Copa", magic: 0},
    %Card{name: "5 de Copa", magic: 1},
    %Card{name: "6 de Copa", magic: 2},
    %Card{name: "7 de Copa", magic: 3},
    %Card{name: "10 de Copa", magic: 4},
    %Card{name: "11 de Copa", magic: 5},
    %Card{name: "12 de Copa", magic: 6},
    %Card{name: "1 de Oro", magic: 7},
    %Card{name: "2 de Oro", magic: 8},
    %Card{name: "3 de Oro", magic: 9},
    %Card{name: "4 de Oro", magic: 0},
    %Card{name: "5 de Oro", magic: 1},
    %Card{name: "6 de Oro", magic: 2},
    %Card{name: "7 de Oro", magic: 10},
    %Card{name: "10 de Oro", magic: 4},
    %Card{name: "11 de Oro", magic: 5},
    %Card{name: "12 de Oro", magic: 6},
    %Card{name: "1 de Palo", magic: 12},
    %Card{name: "2 de Palo", magic: 8},
    %Card{name: "3 de Palo", magic: 9},
    %Card{name: "4 de Palo", magic: 0},
    %Card{name: "5 de Palo", magic: 1},
    %Card{name: "6 de Palo", magic: 2},
    %Card{name: "7 de Palo", magic: 3},
    %Card{name: "10 de Palo", magic: 4},
    %Card{name: "11 de Palo", magic: 5},
    %Card{name: "12 de Palo", magic: 6}
  ]

  test "create_deck/1 creates a new deck, and returns it with the received list of players" do
    assert create_deck("players_list") == [@deck, "players_list"]
  end

  test "shuffle/1 returns a different deck than wich receives (strictly, because of the order)" do
    refute create_deck("players_list") |> shuffle == [@deck, "players_list"]
  end

  test "shuffle/1's result contains all the original cards" do
    shuffled = create_deck("players_list") |> shuffle
    Enum.map(@deck, &(&1 in shuffled))
  end

  test "deal/1 receives a deck (not shuffled, for well cards checking) and a list of 2 players, split the deck in chunks of 3 cards, and gives a chunk to each player. It returns the players with their cards." do
    assert(
      create_deck(@players_2) |> deal == [
        %Team{
          players: [
            %Player{
              card_selected: nil,
              cards: [
                %Card{name: "1 de Espada", magic: 13},
                %Card{name: "2 de Espada", magic: 8},
                %Card{name: "3 de Espada", magic: 9}
              ],
              name: 'Player 1'
            }
          ],
          score: 0,
          score_hand: 0
        },
        %Team{
          players: [
            %Player{
              card_selected: nil,
              cards: [
                %Card{name: "4 de Espada", magic: 0},
                %Card{name: "5 de Espada", magic: 1},
                %Card{name: "6 de Espada", magic: 2}
              ],
              name: 'PC'
            }
          ],
          score: 0,
          score_hand: 0
        }
      ]
    )
  end

  test "deal/1 receives a deck (not shuffled, for well cards checking) and a list of 4 players, split the deck in chunks of 3 cards, and gives a chunk to each player. It returns the players with their cards." do
    assert(
      create_deck(@players_4) |> deal == [
        %Team{
          players: [
            %Player{
              card_selected: nil,
              cards: [
                %Card{name: "1 de Espada", magic: 13},
                %Card{name: "2 de Espada", magic: 8},
                %Card{name: "3 de Espada", magic: 9}
              ],
              name: 'Player 1'
            },
            %Player{
              card_selected: nil,
              cards: [
                %Card{name: "4 de Espada", magic: 0},
                %Card{name: "5 de Espada", magic: 1},
                %Card{name: "6 de Espada", magic: 2}
              ],
              name: 'Player 2'
            }
          ],
          score: 0,
          score_hand: 0
        },
        %Team{
          players: [
            %Player{
              card_selected: nil,
              cards: [
                %Card{name: "7 de Espada", magic: 11},
                %Card{name: "10 de Espada", magic: 4},
                %Card{name: "11 de Espada", magic: 5}
              ],
              name: "PC"
            },
            %Player{
              card_selected: nil,
              cards: [
                %Card{name: "12 de Espada", magic: 6},
                %Card{name: "1 de Copa", magic: 7},
                %Card{name: "2 de Copa", magic: 8}
              ],
              name: "PC-2"
            }
          ],
          score: 0,
          score_hand: 0
        }
      ]
    )
  end
end
