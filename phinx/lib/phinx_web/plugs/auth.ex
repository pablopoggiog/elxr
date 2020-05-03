defmodule Plug.Authenticating do
    import Plug.Conn
    alias Phinx.Users

    def init(default), do: default
  
    def call(conn, _) do
      conn = fetch_query_params(conn)
      [token] = conn |> get_req_header("x-phinx-token")
      IO.inspect token
      case token |> Users.get_by_token do
        {:error, message} ->
          conn
          |> put_status(:unauthorized)
          |> Phoenix.Controller.json(%{"message": "Problem checking user with provided token: #{message}"})
          |> halt
        {:ok, user} ->
          conn
          |> assign(:current_user, user)
      end
    end
  end
