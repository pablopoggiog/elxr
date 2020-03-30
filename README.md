# Elxr

**Projecto correspondiente a segunda clase de capacitacion en Elixir (fallido por el momento, luego de ya dos dias de intentar -> frustrarme -> repetir )**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `elxr` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:elxr, "~> 0.1.0"}
  ]
end
```
## FizzBuzz
Make a fizz_buzz module and write a function called fuzzle that takes three arguments. If the first two are zero, return “FizzBuzz”. If the first is zero, return “Fizz”. If the second is zero return “Buzz”. Otherwise return the third argument.

```
  defmodule FizzBuzz do
    def fuzzle a, b, c do
        cond do
            a == 0 and 2 -> "FizzBuzz"
            b == 0 -> "Fizz"
            c == 0 -> "Buzz"
            true -> 3
        end
    end
  end
```


This docs can be found at [https://hexdocs.pm/elxr](https://hexdocs.pm/elxr).

