defmodule PhinxWeb.HackController do
  use PhinxWeb, :controller
  alias Phinx.Users

  def show(conn, %{"id" => id}) do
    with {:ok, user} <- Users.get_by_id(id) do
      conn
      |> render("hack.json", user: user)
    end
  end
end
