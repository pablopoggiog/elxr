

# Truco
  Truco is a game developed in Elixir, as a TP for a class.  

  You'll 

## Pre-requisites 📋
  Must have been installed Elixir.

## Installation 🔧
  You must clone the repository, install all the dependencies (mix deps.get in console).

  Example: 

    $ git clone https://github.com/Phinxlab/elixir-trainings/tree/pablo-poggio/class-6
    $ mix deps.get

## Testing ⚙️
  Running in the console 'mix test' you'll can run the tests for the project. 

  There are 5 tests. First one checks that create_deck/1 creates a new deck, and returns it with the received list of players.

  Second one, that shuffle/1 returns a different deck than wich receives (strictly, because what mattersof the order).

  The third one, checks that shuffle/1's result contains all the original cards. It's a "reforce" for the second test.

  Then, the fourth ensures that deal/1 -receiving a deck (not shuffled, for well cards checking) and a list of 2 players-, split the deck in chunks of 3 cards, and gives a chunk to each player. It should returns the players with their cards.

  And the fifth one does the same, but for 4 players. 

  *In several of these tests, are being used some constants previusly declared in game_test.exs for the deck and for the players, for making less verbose the tests.*

  Example: 

  $ mix test
  $ Compiling 1 file (.ex)
    .....

    Finished in 0.1 seconds
    5 tests, 0 failures

    Randomized with seed 990000


## Example of playing ⌨️
    iex(2)> Truco.play

    Bienvenido a Truco

    Cuantas personas quieren ser en el equipo?
    1

    Como es tu nombre?
    pablo

    Pablo, estas son tus cartas:
    4 de Copa
    5 de Oro
    3 de Espada

    Cual quieres elegir?
    ( 1 - 2 - 3 )

    Elije el numero 1

    ---------- Perdiste la mano! ----------

    Pablo, estas son tus cartas:
    5 de Oro
    3 de Espada

    Cual quieres elegir?
    ( 1 - 2 - 3 )

    Elije el numero 1

    ---------- Ganaste la mano! ----------

    Pablo, estas son tus cartas:
    3 de Espada

    Cual quieres elegir?
    ( 1 - 2 - 3 )

    Elije el numero 1

    ---------- Mano empatada! ----------
    --------------- Empate ---------------
    El contador sigue 0 a 0

    Pablo, estas son tus cartas:
    7 de Copa
    7 de Oro
    6 de Oro

    Cual quieres elegir?
    ( 1 - 2 - 3 )

    Elije el numero 1

    ---------- Perdiste la mano! ----------

    Pablo, estas son tus cartas:
    7 de Oro
    6 de Oro

    Cual quieres elegir?
    ( 1 - 2 - 3 )

    Elije el numero 1

    ---------- Ganaste la mano! ----------

    Pablo, estas son tus cartas:
    6 de Oro

    Cual quieres elegir?
    ( 1 - 2 - 3 )

    Elije el numero 1

    ---------- Ganaste la mano! ----------
    --------------- Gano Team 1 ---------------
    El contador va 1 a 0

    Pablo, estas son tus cartas:
    6 de Oro
    5 de Espada
    4 de Oro

    Cual quieres elegir?
    ( 1 - 2 - 3 )

    Elije el numero 1

    ---------- Perdiste la mano! ----------

    Pablo, estas son tus cartas:
    5 de Espada
    4 de Oro

    Cual quieres elegir?
    ( 1 - 2 - 3 )

    Elije el numero 1

    ---------- Perdiste la mano! ----------

    Pablo, estas son tus cartas:
    4 de Oro

    Cual quieres elegir?
    ( 1 - 2 - 3 )

    Elije el numero 1

    ---------- Perdiste la mano! ----------
    --------------- Gano Team 2 ---------------
    El contador va 1 a 1

    Pablo, estas son tus cartas:
    4 de Oro
    10 de Oro
    7 de Espada

    Cual quieres elegir?
    ( 1 - 2 - 3 )

    Elije el numero 1

    ---------- Perdiste la mano! ----------

    Pablo, estas son tus cartas:
    10 de Oro
    7 de Espada

    Cual quieres elegir?
    ( 1 - 2 - 3 )

    Elije el numero 1

    ---------- Ganaste la mano! ----------

    Pablo, estas son tus cartas:
    7 de Espada

    Cual quieres elegir?
    ( 1 - 2 - 3 )

    Elije el numero 1

    ---------- Ganaste la mano! ----------
    --------------- Gano Team 1 ---------------
    El contador va 2 a 1

    Pablo, estas son tus cartas:
    5 de Espada
    12 de Copa
    3 de Copa

    Cual quieres elegir?
    ( 1 - 2 - 3 )

    Elije el numero 1

    ---------- Ganaste la mano! ----------

    Pablo, estas son tus cartas:
    12 de Copa
    3 de Copa

    Cual quieres elegir?
    ( 1 - 2 - 3 )

    Elije el numero 1

    ---------- Perdiste la mano! ----------

    Pablo, estas son tus cartas:
    3 de Copa

    Cual quieres elegir?
    ( 1 - 2 - 3 )

    Elije el numero 1

    ---------- Ganaste la mano! ----------

    -*-*-*-*-*-*-*- Felicitaciones, ganaste el juego! -*-*-*-*-*-*-*-

    Queres jugar de nuevo? (s/n)n

    Gracias por jugar Truco

## Authors ✒️
  Most of the base-work made by Mariano Vitale, "enhances" (with uglyer code) made by Pablo Poggio.

Project full of things to enhance 🤓, is a first aproach to a full console-app in Elixir.