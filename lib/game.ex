defmodule Truco.Game do
  @moduledoc """

    The more "generic" logic of a cards game is in here.    
    The idea was to make a reusable logic, for applying in several games. 

  """
  alias Truco.Card
  alias Truco.Player
  alias Truco.Team
  alias Truco

  @doc """

    This function creates the players for the game, at the moment could be 2 or 4 (easily upgrated to 6 if necessary).
    Asks for a name trough the terminal, then slice it for taking just the name without the defult breakline (\\n), and finally its first letter gets uppercased.

  """

  def create_players do
    input = IO.gets("\nCuantas personas quieren ser en el equipo?\n")
    {n, _} = Integer.parse(input)

    case n do
      1 ->
        name_1 = IO.gets("\nComo es tu nombre?\n")
        name_1_without_breakline = name_1 |> String.slice(0..-2) |> String.capitalize()

        [
          %Team{players: [%Player{name: name_1_without_breakline}]},
          %Team{players: [%Player{name: 'PC'}]}
        ]

      2 ->
        name_1 = IO.gets("\nJugador 1! Como es tu nombre?\n")
        name_2 = IO.gets("\nJugador 2! Como es tu nombre?\n")
        name_1_without_breakline = name_1 |> String.slice(0..-2) |> String.capitalize()
        name_2_without_breakline = name_2 |> String.slice(0..-2) |> String.capitalize()

        [
          %Team{
            players: [
              %Player{name: name_1_without_breakline},
              %Player{name: name_2_without_breakline}
            ]
          },
          %Team{players: [%Player{name: "PC"}, %Player{name: "PC-2"}]}
        ]

      _ ->
        IO.puts("\nSe puede jugar con 2 o 4 jugadores, por favor ingresa uno de estos dos")
        create_players()
    end
  end

  @doc """

    This function creates a default deck, with all the common cards of a spanish deck.

  """
  def create_deck(players_list) do
    [
      [
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
      ],
      players_list
    ]
  end

  @doc """

    Here, the supplied deck is going to be shuffled.

  """
  def shuffle([deck, players_list]) do
    shuffled = Enum.shuffle(deck)
    [shuffled, players_list]
  end

  @doc """

    And here, the resulting shuffled deck is divided in chunks, and splitted between players.

  """
  def deal([
        deck,
        [%Team{players: players_team_1} = team_1, %Team{players: players_team_2} = team_2]
      ]) do
    case Enum.count(players_team_1) do
      1 ->
        [player_1] = players_team_1
        [player_2] = players_team_2

        [cards_1, cards_2 | _res] =
          deck
          |> Enum.chunk(3)

        [
          %Team{team_1 | players: [%Player{player_1 | cards: cards_1}]},
          %Team{team_2 | players: [%Player{player_2 | cards: cards_2}]}
        ]

      2 ->
        [player_1, player_2] = players_team_1
        [player_3, player_4] = players_team_2

        [cards_1, cards_2, cards_3, cards_4 | _res] =
          deck
          |> Enum.chunk(3)

        [
          %Team{
            team_1
            | players: [%Player{player_1 | cards: cards_1}, %Player{player_2 | cards: cards_2}]
          },
          %Team{
            team_2
            | players: [%Player{player_3 | cards: cards_3}, %Player{player_4 | cards: cards_4}]
          }
        ]
    end
  end
end
