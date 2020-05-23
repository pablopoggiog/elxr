defmodule BlockappWeb.RegistrationController do
  use BlockappWeb, :controller
  alias Blockapp.Accounts

  alias BlockappWeb.Authentication

  def create(conn, %{"account" => account_params}) do
    case Accounts.register(account_params) do
      {:ok, account} ->
        conn
        |> Authentication.log_in(account)
        |> redirect(to: Routes.profile_path(conn, :show))

      {:error, changeset} ->
        render(conn, :new,
          changeset: changeset,
          action: Routes.registration_path(conn, :create)
        )
    end
  end

  def new(conn, _) do
    render(conn, :new,
      changeset: Accounts.change_account(),
      action: Routes.registration_path(conn, :create)
    )
  end
end
