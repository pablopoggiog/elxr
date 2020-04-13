defmodule Truco.Turn do
  @moduledoc """
  Keeps the logic of the mayority of the game. It envolves the logic of a whole turn. 
  """
    alias Truco.Player
    alias Truco.Team
    alias Truco.Card 

    @doc """
    
    This function encompasses a new whole hand, receiving a list of players, and using other 4 (private) functions inside.
  
    """
    
  def play_hand([%Team{players: players_1, score_hand: score_hand_1, score: score_1} = team_1, %Team{score_hand: score_hand_2, score: score_2} = team_2] = teams) do
    [player_1 | _] = players_1
    %{cards: cards_1} = player_1    
    cond do       
      cards_1 == [] and score_hand_1 > score_2 and score_1 == 2 -> 
        IO.puts("\n-*-*-*-*-*-*-*- Felicitaciones, ganaste el juego! -*-*-*-*-*-*-*-") 
        again = IO.gets("\nQueres jugar de nuevo? (s/n)") 
        case again do
          "s\n" -> Truco.play()
          "n\n" -> IO.puts("\nGracias por jugar Truco")
        end    
      cards_1 == [] and score_hand_1 < score_hand_2 and score_2 == 2 -> 
        IO.puts("\n-*-*-*-*-*-*-*- Sera la proxima...! -*-*-*-*-*-*-*-") 
        again = IO.gets("\nQueres jugar de nuevo? (s/n)") 
        case again do
            "s\n" -> Truco.play()
            "n\n" -> IO.puts("\nGracias por jugar Truco")
          end 
      cards_1 == [] and score_hand_1 > score_hand_2 -> 
        IO.puts "--------------- Gano Team 1 ---------------"
        IO.puts "El contador va #{score_1 + 1} a #{score_2}"
        [%Team{team_1 | score_hand: 0, score: score_1 + 1}, team_2]
        |> Truco.play
      cards_1 == [] and score_hand_1 < score_hand_2 -> 
        IO.puts "--------------- Gano Team 2 ---------------"
        IO.puts "El contador va #{score_1} a #{score_2 + 1}"
        [team_1, %Team{team_2 | score_hand: 0, score: score_2 + 1}]
        |> Truco.play
      cards_1 == [] -> 
        IO.puts "--------------- Empate ---------------"
        IO.puts "El contador sigue #{score_1} a #{score_2}"
        teams
        |> Truco.play
      true ->
        teams
        |> choose
        |> compare
        |> win_or_loose
        |> check
    end   
  end

  def play_hand(list_players) do
    list_players
  end

    @doc """
    
    Here, the players will select their cards to play in the current hand.
    The first function will take the cases with 2 players, and the second one with 4 players.
  
    """
  defp choose(
    [%Team{players: [%Player{name: name_1, cards: cards_1} = player_1], score_hand: score_hand_1} = team_1,
    %Team{players: [%Player{cards: cards_2} = player_2], score_hand: score_hand_2} = team_2]) do
    IO.puts("\n#{name_1}, estas son tus cartas:")

    cards_1
    |> Enum.map(fn %Card{name: name} -> IO.puts(name) end)

    index = IO.gets("\nCual quieres elegir?\n( 1 - 2 - 3 )\n\nElije el numero ")
    {card_number_player_1, _} = Integer.parse(index)

    card_player_1 =
      cards_1
      |> Enum.at(card_number_player_1 - 1)

      cond do
        score_hand_1 == 0 && score_hand_2 == 1 ->
          card_player_2 =
            cards_2
            |> Enum.min_by(&(&1.magic))

            [
              %Team{team_1 | players: [%Player{player_1 | card_selected: card_player_1, cards: cards_1}]},
              %Team{team_2 | players: [%Player{player_2 | card_selected: card_player_2, cards: cards_2}]}
            ]
        true -> 
          card_player_2 =
            cards_2
            |> Enum.max_by(&(&1.magic))

            [
              %Team{team_1 | players: [%Player{player_1 | card_selected: card_player_1, cards: cards_1}]},
              %Team{team_2 | players: [%Player{player_2 | card_selected: card_player_2, cards: cards_2}]}
            ]
      
      end
  end

  defp choose(
      [%Team{players: [%Player{name: name_1, cards: cards_1} = player_1,
      %Player{name: name_2, cards: cards_2} = player_2], 
      score_hand: score_hand_1} = team_1,
      %Team{players: [%Player{cards: cards_3} = player_3,
      %Player{cards: cards_4} = player_4],
      score_hand: score_hand_2} = team_2]
    ) do

    # Elije el player 1
    IO.puts("\n#{name_1}, estas son tus cartas:")

    cards_1
    |> Enum.map(fn %Card{name: name} -> IO.puts(name) end)

    index = IO.gets("\nCual quieres elegir?\n( 1 - 2 - 3 )\n\nElije el numero ")
    {card_number_player_1, _} = Integer.parse(index)

    card_player_1 =
      cards_1
      |> Enum.at(card_number_player_1 - 1)

    #  Elije el player 2
    IO.puts("\n#{name_2}, estas son tus cartas:")

    cards_2
    |> Enum.map(fn %Card{name: name} -> IO.puts(name) end)

    index = IO.gets("\nCual quieres elegir?\n( 1 - 2 - 3 )\n\nElije el numero ")
    {card_number_player_2, _} = Integer.parse(index)

    card_player_2 =
      cards_2
      |> Enum.at(card_number_player_2 - 1)

      cond do
        score_hand_1 == 0 && score_hand_2 == 1 ->
          card_player_3 =
            cards_3
            |> Enum.min_by(&(&1.magic))
          card_player_4 =
            cards_4
            |> Enum.min_by(&(&1.magic))
            
          [%Team{team_1 | players: [
            %Player{player_1 | card_selected: card_player_1, cards: cards_1},
            %Player{player_2 | card_selected: card_player_2, cards: cards_2}
          ]}, 
          %Team{team_2 | players: [
            %Player{player_3 | card_selected: card_player_3, cards: cards_3},
            %Player{player_4 | card_selected: card_player_4, cards: cards_4}
          ]}]
        true -> 
          card_player_3 =
            cards_3
            |> Enum.max_by(&(&1.magic))  
            card_player_4 =
            cards_4
            |> Enum.max_by(&(&1.magic))  
            
            [%Team{team_1 | players: [
              %Player{player_1 | card_selected: card_player_1, cards: cards_1},
              %Player{player_2 | card_selected: card_player_2, cards: cards_2}
            ]}, 
            %Team{team_2 | players: [
              %Player{player_3 | card_selected: card_player_3, cards: cards_3},
              %Player{player_4 | card_selected: card_player_4, cards: cards_4}
            ]}]         
      end
      

  end

    @doc """
    
    Here, the players will compare their selected cards, and will be defined winners and loosers (just for the hand).
    The first function will take the cases with 2 players, and the second one with 4 players.
  
    """
  defp compare([
    %Team{players: [%Player{card_selected: %Card{magic: magic_1}}]} = team_1,
    %Team{players: [%Player{card_selected: %Card{magic: magic_2}}]} = team_2
      ]) do
    cond do
      magic_1 > magic_2 ->
        {:win, [team_1, team_2]}

      magic_1 < magic_2 ->
        {:loose, [team_1, team_2]}

      true ->
        {:tie, [team_1, team_2]}
    end
  end

  defp compare([
    %Team{players: [%Player{card_selected: %Card{magic: magic_1}},
      %Player{card_selected: %Card{magic: magic_2}}]} = team_1,
    %Team{players: [%Player{card_selected: %Card{magic: magic_3}},
      %Player{card_selected: %Card{magic: magic_4}}]} = team_2
      ]) do

        magics = [magic_1, magic_2, magic_3, magic_4]
        greater = Enum.max(magics)
        # 
        # 
        # 
        # 
        # 
        # TODO: AGREGAR CLAUSE POR SI HAY EMPATE DE MAGICS
        # 
        # 
        # 
        # 
        cond do
          greater == magic_1 ->
            {:win, [team_1, team_2]}
          greater == magic_2 ->
            {:win, [team_1, team_2]}
          greater == magic_3 ->
            {:loose, [team_1, team_2]}
          greater == magic_4 ->
            {:loose, [team_1, team_2]}
        end
  end

    @doc """
    
    This function takes the status generated by compare(), and the usual list of teams.
    Will give advice of the winner and looser of the hand through the terminal, and sill wum the corresponding hand-point to the winner.
  
    """
  defp win_or_loose(
        {status, [%Team{score_hand: score_hand_1} = team_1, %Team{score_hand: score_hand_2} = team_2]}
      ) do
    case status do
      :win ->
        IO.puts("\n---------- Ganaste la mano! ----------")
        [%Team{team_1 | score_hand: score_hand_1 + 1}, team_2]

      :loose ->
        IO.puts("\n---------- Perdiste la mano! ----------")
        [team_1, %Team{team_2 | score_hand: score_hand_2 + 1}]

      :tie ->
        IO.puts("\n---------- Mano empatada! ----------")
        [team_1, team_2]
    end
  end

    @doc """
    
    In check(), the selected cards will be removed from the cards list of each player.
    The first function will take the cases with 2 players, and the second one with 4 players.
  
    """
  defp check([
    %Team{players: [%Player{cards: cards_1, card_selected: %Card{name: card_name_1}} = player_1]} = team_1,
    %Team{players: [%Player{cards: cards_2, card_selected: %Card{name: card_name_2}} = player_2]} = team_2
      ]) do
    cards_remained_1 =
      cards_1
      |> Enum.filter(fn %Card{name: card_name_filter_1} -> card_name_filter_1 != card_name_1 end)

    cards_remained_2 =
      cards_2
      |> Enum.filter(fn %Card{name: card_name_filter_2} -> card_name_filter_2 != card_name_2 end)

    [
      %Team{team_1 | players: [%Player{player_1 | cards: cards_remained_1, card_selected: nil}]},
      %Team{team_2 | players: [%Player{player_2 | cards: cards_remained_2, card_selected: nil}]}
    ]

    |> play_hand
  end

  # check para 4 players
  defp check([
    %Team{players: [%Player{cards: cards_1, card_selected: %Card{name: card_name_1}} = player_1,
    %Player{cards: cards_2, card_selected: %Card{name: card_name_2}} = player_2]} = team_1,
    %Team{players: [%Player{cards: cards_3, card_selected: %Card{name: card_name_3}} = player_3,
    %Player{cards: cards_4, card_selected: %Card{name: card_name_4}} = player_4]} = team_2
      ]) do
    cards_remained_1 =
      cards_1
      |> Enum.filter(fn %Card{name: card_name_filter_1} -> card_name_filter_1 != card_name_1 end)

    cards_remained_2 =
      cards_2
      |> Enum.filter(fn %Card{name: card_name_filter_2} -> card_name_filter_2 != card_name_2 end)

    cards_remained_3 =
      cards_3
      |> Enum.filter(fn %Card{name: card_name_filter_3} -> card_name_filter_3 != card_name_3 end)

    cards_remained_4 =
      cards_4
      |> Enum.filter(fn %Card{name: card_name_filter_4} -> card_name_filter_4 != card_name_4 end)

    [
      %Team{ team_1 | players: [%Player{player_1 | cards: cards_remained_1, card_selected: nil},
        %Player{player_2 | cards: cards_remained_2, card_selected: nil}]},
      %Team{team_2 | players: [%Player{player_3 | cards: cards_remained_3, card_selected: nil},
        %Player{player_4 | cards: cards_remained_4, card_selected: nil}]}
    ]

    |> play_hand
  end

end