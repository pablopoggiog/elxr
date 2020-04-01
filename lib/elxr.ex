defmodule Elxr do
  @moduledoc """
  Documentation for Elxr.
  """
  defmodule Fizz_buzz do
    @moduledoc """
    Make a fizz_buzz module and write a function called fuzzle that takes three arguments. 
    If the first two are zero, return “FizzBuzz”. 
    If the first is zero, return “Fizz”. 
    If the second is zero return “Buzz”. 
    Otherwise return the third argument. 
    You don't need to use recursion here, create 2 methods, one using cond do, and the other one case do.
    """
  
    @doc """
        iex(4)> Elxr.Fizz_buzz.fuzzle(0, 0, 3)    
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
  
    @doc """
        iex(3)> Elxr.Fizz_buzz.fuzzle2([1, 0, 3]) 
        "Buzz"
  
    """    
    def fuzzle2 lista do
        case lista do
            [0, 0, _] -> "FizzBuzz"
            [0, _, _] -> "Fizz"
            [_, 0, _] -> "Buzz"
            [_, _, c] -> c
        end
    end
  end
  


  defmodule Api_response do
    @moduledoc """
    Documentation for Api_response.

    Make a api_response module, it will receive an tuple, the first item will be an atom (:ok and :error) and the other one will be a map (we don't need to care about the second item). The idea is very similar to the previous one, we need to create 4 function (if and else, cond, case, functions ) that returns the same response, for example:
      ApiResponse.handle_response_1({:ok, %{blabla}}) ->"Ok"
      ApiResponse.handle_response_1({:error, %{blabla}}) ->"Error"
      ApiResponse.handle_response_1({:what, %{blabla}}) -> :no_match_message_error

    """        
    @doc """
  
    ## Examples
            iex(1)> Api_response.ifElse({:ok, "hola"})
            "Ok"

            iex(1)> Api_response.ifElse({:error, "hola"})
            "Error"

            iex(1)> Api_response.ifElse({:adae, "hola"})
            "Se obtuvo una respuesta de estado no esperada"
  
    """   

    def ifElse {atom, _map} do
        if (atom == :ok) do
            "Ok"
        else 
            if (atom == :error) do
                "Error"
            else 
              "Se obtuvo una respuesta de estado no esperada"
            end
        end

    end

    @doc """
  
    ## Examples

            iex(1)> Api_response.ifElse({:ok, "hola"})
            "Ok"

            iex(1)> Api_response.condDo({:error, "hola"})  
            "Error"

            iex(1)> Api_response.condDo({:errore, "hola"})
            "Se obtuvo una respuesta de estado no esperada"
  
    """   

    def condDo {atom, _map} do
        cond do
            atom == :ok -> "Ok"
            atom == :error -> "Error"
            true -> "Se obtuvo una respuesta de estado no esperada"
        end
    end

    @doc """
  
    ## Examples

            iex(1)> Api_response.caseDo({:ok, "hola"})
            "Ok"

            iex(1)> Api_response.caseDo({:error, "hola"}) 
            "Error"

            iex(1)> Api_response.caseDo({:adfd, "hola"})
            "Se obtuvo una respuesta de estado no esperada"
  
    """   

    def caseDo {atom, _map} do
        case atom do
            :ok -> "Ok"
            :error -> "Error"
            _atom -> "Se obtuvo una respuesta de estado no esperada"
        end
    end   

    @doc """
  
    ## Examples

            iex(1)> Api_response.func({:ok, "hola"})    
            "Ok"

            iex(1)> Api_response.func({:error, "hola"})   
            "Error"

            iex(1)> Api_response.func({:lfdmg, "hola"}) 
            "Se obtuvo una respuesta de estado no esperada"
  
    """       
    
    def func {:ok, _map} do
        "Ok"
    end

    def func {:error, _map} do
        "Error"
    end
    
    def func {_atom, _map} do
        "Se obtuvo una respuesta de estado no esperada"
    end

  end
  
end
