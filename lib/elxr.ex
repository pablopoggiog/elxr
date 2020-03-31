defmodule Elxr do
  @moduledoc """
    **Proyecto correspondiente a segunda clase de capacitacion en Elixir (de momento no funciona modulo Word_count, y la funcion Filter no esta debidamente hecha) **
  """

  defmodule Fizz_buzz do    
    @moduledoc """
      Make a fizz_buzz module and write a function called fuzzle that takes three arguments. If the first two are zero, return “FizzBuzz”. If the first is zero, return “Fizz”. If the second is zero return “Buzz”. Otherwise return the third argument.
    """

      @doc """
        iex(1)> Elxr.Fizz_buzz.fuzzle(0, 0, 43)  
        "FizzBuzz"
      """
    def fuzzle a, b, c do
        cond do
            a == 0 and b == 0 -> "FizzBuzz"
            a == 0 -> "Fizz"
            b == 0 -> "Buzz"
            true -> c
        end
    end
  end

  defmodule Enum_operations do
    @moduledoc """
      Make an enum_operations module, it should have the following methods: count, reverse, filter, concat. You need to build the same logic as the Enum module does for this methods (just for list). The point of this exercise is to create this basic functions yourself.
    """
      @doc """
            iex(1)> Elxr.Enum_operations.count([12, 123, 345, 456, 76])                         
            El enumerable pasado tiene 5 elementos
            :ok
      """
    def count(enumerable) do
      ultimo = Enum.at(enumerable, -1)
      ultimoIndex = Enum.find_index(enumerable, &(&1 == ultimo))
      cantidad = ultimoIndex + 1
      IO.puts("El enumerable pasado tiene #{cantidad} elementos")
    end
    
      @doc """
            iex(1)> Elxr.Enum_operations.reverse [12, 123, 345, "hola", %{"nombre" => "pablo"}] 
            [%{"nombre" => "pablo"}, "hola", 345, 123, 12]
            [%{"nombre" => "pablo"}, "hola", 345, 123, 12]
      """
    def reverse(enumerable) do
      Enum.sort(enumerable, &(Enum.find_index(enumerable, fn x -> x == &1 end) >= Enum.find_index(enumerable, fn x -> x == &2 end)))
      |> IO.inspect
    end

      @doc """
            iex(1)> Elxr.Enum_operations.concat([[123, 32], ["hola", :ok]]) 
            [123, 32, "hola", :ok]
            [123, 32, "hola", :ok]
      """
    def concat(enumerable) do
      Enum.reduce(enumerable, &(&2 ++ &1))
      |> IO.inspect
    end

      @doc """
            iex(1)> Elxr.Enum_operations.filter([1, 2, 3, 4, 5], fn x -> x <= 4 end)
            [1, 2, 3, 4]
            [1, 2, 3, 4]
      """
    def filter(enumerable, fun) do
      # Claramente no es lo que tengo que hacer, solo lo pongo antes que dejarlo vacio:
      Enum.reject(enumerable, &(!fun.(&1))) 
      |> IO.inspect
    end

  end

defmodule Word_count do
  @moduledoc """
    Make a word_count module, given a phrase, count the occurrences of each word in that phrase, for example, for the input: "Hello to all the world world", the output should be the following:
    %{"hello" => 1, "to" => 1, "all" => 1, "the" => 1, "world" => 2}
    
    No finalizado, no funciona.  
    """

    def main(phrase) do
      # array = String.split(phrase, " ")
      # IO.inspect(array)
      # arrayNoRep = Enum.uniq(array)
      # Enum.count(array, &Enum.member?(arrayNoRep, &1))
    end
end

end
