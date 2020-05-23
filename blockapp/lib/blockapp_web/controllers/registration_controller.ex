defmodule BlockappWeb.RegistrationController do
  use BlockappWeb, :controller

  def new(conn, _) do
    render(conn, :new,
      changeset: Accounts.change_account(),
      action: Routes.registration_path(conn, :create)
    )
  end

  def create(%{assigns: %{ueberauth_auth: auth_params}} = conn, _params) do
    case Accounts.register(auth_params) do
      {:ok, account} ->
        redirect(conn, to: Routes.profile_path(conn, :show))

      {:error, changeset} ->
        render(conn, :new,
          changeset: changeset,
          action: Routes.registration_path(conn, :create)
        )
    end
  end
end
