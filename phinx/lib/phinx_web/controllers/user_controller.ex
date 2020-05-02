defmodule PhinxWeb.UserController do
  use PhinxWeb, :controller
  alias Phinx.Users

  action_fallback PhinxWeb.FallbackController

  def index(conn, _) do
    users = Users.get_all()

    conn
    |> render("index.json", users: users)
  end

  def show(conn, %{"id" => id}) do
    with {:ok, user} <- Users.get_by_id(id) do
      conn
      |> render("user.json", user: user)
    end
  end

  def create(conn, %{"user" => user}) do
    with {:ok, user} <- Users.create(user) do
      conn
      |> render("user.json", user: user)
    end
  end

  def update(conn, %{"id" => id, "user" => user}) do
    with {:ok, user_to_update} <- id |> Users.get_by_id(),
         {:ok, updated_user} <- Users.update(user_to_update, user) do
      conn
      |> render("user.json", user: updated_user)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, user_to_delete} <- Users.get_by_id(id),
         {:ok, _} <- Users.delete(user_to_delete) do
      conn
      |> render("delete.json", user: user_to_delete)
    end
  end
end
