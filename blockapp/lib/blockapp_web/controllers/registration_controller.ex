defmodule BlockappWeb.RegistrationController do
  use BlockappWeb, :controller
  plug Ueberauth
  alias Blockapp.Accounts

  alias BlockappWeb.Authentication

  # def create(conn, %{"account" => account_params}) do
  #   case Accounts.register(account_params) do
  #     {:ok, account} ->
  #       conn
  #       |> Authentication.log_in(account)
  #       |> redirect(to: Routes.block_path(conn, :index))

  #     {:error, changeset} ->
  #       render(conn, :new,
  #         changeset: changeset,
  #         action: Routes.registration_path(conn, :create)
  #       )
  #   end
  # end
  
  def create(%{assigns: %{ueberauth_auth: auth_params}} = conn, _params) do
    case Accounts.register(auth_params) do
      {:ok, account} ->
        IO.inspect account
        conn
        |> Authentication.log_in(account)
        redirect(conn, to: Routes.block_path(conn, :index))

      {:error, changeset} ->
        IO.inspect "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
        render(conn, :new,
          changeset: changeset,
          action: Routes.registration_path(conn, :create)
        )
    end
  end

  def new(conn, _) do
    # if Authentication.get_current_account(conn) do
    #   redirect(conn, to: Routes.block_path(conn, :index))
    # else
      render(
        conn,
        :new,
        changeset: Accounts.change_account(),
        action: Routes.registration_path(conn, :create)
      )
    # end
  end
end
