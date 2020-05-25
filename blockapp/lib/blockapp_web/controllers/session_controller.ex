defmodule BlockappWeb.SessionController do
  use BlockappWeb, :controller
  alias Blockapp.Accounts
  alias BlockappWeb.Authentication
  plug Ueberauth

  # ...
  def create(conn, %{"account" => %{"email" => email, "password" => password}}) do
    case email |> Accounts.get_by_email() |> Authentication.authenticate(password) do
      {:ok, account} ->
        IO.inspect "QUE BAILE TU VIEJA EN TANGA PARA LA BANDA"
        conn
        |> Authentication.log_in(account)
        |> redirect(to: Routes.block_path(conn, :index))

      {:error, :invalid_credentials} ->
        conn
        |> put_flash(:error, "Incorrect email or password")
        |> new(%{})
    end
  end


  def new(conn, _params) do
    if current = Authentication.get_current_account(conn) do
      IO.inspect current
      redirect(conn, to: Routes.block_path(conn, :index))
    else
      render(
        conn,
        :new,
        changeset: Accounts.change_account(),
        action: Routes.session_path(conn, :create)
      )
    end
  end
  
  def delete(conn, _params) do
    conn
    |> Authentication.log_out()
    |> redirect(to: Routes.session_path(conn, :new))
  end
end
