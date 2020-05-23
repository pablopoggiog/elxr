defmodule Blockapp.Accounts do
  alias Blockapp.Repo
  alias __MODULE__.Account

  def register(%Ueberauth.Auth{} = params) do
    %Account{}
    |> Account.changeset(extract_account_params(params))
    |> Blockapp.Repo.insert()
  end

  defp extract_account_params(%{credentials: %{other: other}, info: info}) do
    info
    |> Map.from_struct()
    |> Map.merge(other)
  end

  def change_account(account \\ %Account{}) do
    Account.changeset(account, %{})
  end
  
  def get_account(id) do
    Repo.get(Account, id)
  end
end
