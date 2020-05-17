defmodule BlockchainWeb.AccountController do
  use BlockchainWeb, :controller
  alias Blockchain.Accounts

  def index(conn, _) do
    users = Accounts.list_users()

    conn
    |> render("index.html", users: users)
  end

  def show(conn, %{"id" => id}) do
    with user <- Accounts.get_user!(id) do
      IO.inspect("ASDFASFASFASDF")
      IO.inspect(user)
      changeset = Accounts.changeset(user)

      conn
      |> render("show.html", user: user, changeset: changeset)
    end
  end

  def new(conn, _params) do
    changeset = Accounts.changeset()
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user}) do
    case Accounts.create_user(user) do
      {:ok, _} ->
        users = Accounts.list_users()

        conn
        |> put_flash(:info, "User created!")
        |> render("index.html", users: users)

      {:error, changeset} ->
        conn
        # |> put_flash(:error, "Error, try again")
        |> render("new.html", changeset: changeset)
    end
  end

  # def update(conn, %{"id" => id, "user" => user}) do
  #   with {:ok, user_to_update} <- id |> Accounts.get_user!(),
  #        {:ok, updated_user} <- Accounts.update_user(user_to_update, user) do
  #     conn
  #     |> put_flash(:info, "User updated")
  #     |> redirect(to: Routes.account_path(conn, :index))
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   with {:ok, user_to_delete} <- Accounts.get_user!(id),
  #        {:ok, _} <- Accounts.delete_user(user_to_delete) do
  #     conn
  #     |> render("delete.json", user: user_to_delete)
  #   end
  # end
end
