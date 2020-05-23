defmodule BlockappWeb.Authentication do
    @moduledoc """
    Implementation module for Guardian and functions for authentication.
    """
    use Guardian, otp_app: :Blockapp
    alias Blockapp.{Accounts, Accounts.Account}
  
    def subject_for_token(resource, _claims) do
      {:ok, to_string(resource.id)}
    end
  
    def resource_from_claims(%{"sub" => id}) do
      case Accounts.get_account(id) do
        nil -> {:error, :resource_not_found}
        account -> {:ok, account}
      end
    end
    
    def log_in(conn, account) do
      __MODULE__.Plug.sign_in(conn, account)
    end
  end