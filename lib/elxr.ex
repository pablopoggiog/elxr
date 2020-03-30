defmodule Elxr do
  @moduledoc """
  Documentation for Elxr.
  """

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
  

  # defmodule Enum_operations do
  #   def count(enumerable) do
  #       counter = 0
  #       Enum.reduce enumerable, fn (item, acc) ->
  #         IO.puts(item)
  #         IO.puts(acc)
  #         Enum.find_index(enumerable, fn coso -> coso === item end) + Enum.find_index(enumerable, fn coso -> coso === acc end) + 1
  #         # if acc !== 12, do: acc = 1, else: acc = acc + 1
  #       end
  #       |> IO.inspect
  #   end
  # end
        # def funcion(elem) do
        #     acc+
        # end
    # def filter(enumerable, fun) do
    #     newEnum = []
    #     def filtrador(element, function) do
            
    #     end
    #     Enum.map(enumerable, filtrador(el, fun) fn el -> case fun do true -> newEnum[] )
    # end
    # def concat do
        
    # end

# defmodule Word_count do
#     def main(phrase) do
#       phrase
#       |> String.split(" ")
#       |> Enum.filter(fn x -> )
#     end

#     def rec(n) do
#       result = n + rec(n - 1)
#     end
# end
#         # IO.gets('Decime una oracion ')
#         String.trim("hola como estas")[0]
#         # ["Hello", "world", "world"]
#         # |> Enum.map() BORRAR ESTO SI LO DESCARTO
#         |> Enum.reduce(%{}, fn word, acc ->
#             case acc do
#                 %{^word => count} -> %{acc | word => count + 1}
#             end)
#         |> IO.puts('holis')





        # Enum.each enumerable, fn item ->
        # if item in counter, do: IO.puts("existe la palabra en el counter"), else: IO.puts("no existe la palabra en el counter") counter.
        # IO.inspect counter


end
