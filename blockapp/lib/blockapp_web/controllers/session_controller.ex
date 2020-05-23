defmodule BlockappWeb.SessionController do
  use BlockappWeb, :controller
  alias Blockapp.Accounts
  alias BlockappWeb.Authentication

  # ...
  def create(conn, %{"account" => %{"email" => email, "password" => password}}) do
    case email |> Accounts.get_by_email() |> Authentication.authenticate(password) do
      {:ok, account} ->
        conn
        |> Authentication.log_in(account)
        |> redirect(to: Routes.profile_path(conn, :show))

      {:error, :invalid_credentials} ->
        conn
        |> put_flash(:error, "Incorrect email or password")
        |> new(%{})
    end
  end

  def new(conn, _params) do
    render(conn, :new, changeset: conn, action: "/login")
  end
end
