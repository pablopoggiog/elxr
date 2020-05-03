defmodule Phinx.Users do
  alias Phinx.Users.Schema.User
  alias Phinx.Repo

  def get_all do
    User
    |> Repo.all()
  end

  def get_by_id(id) do
    case user = Repo.get(User, id) do
      %User{} -> {:ok, user}
      nil -> {:error, :not_found}
    end
  end
  
  def get_by_token(token) do
    case user = Repo.get_by(User, token: token) do
      %User{} -> {:ok, user}
      nil -> {:error, :not_found}
    end
  end

  def create(attrs) do
    case %User{} |> User.changeset(attrs) |> Repo.insert() do
      {:ok, user} -> {:ok, user}
      nil -> {:error, 400}
    end
  end

  def update(user, attrs) do
    case user |> User.changeset(attrs) |> Repo.update() do
      {:ok, updated} -> {:ok, updated}
    end
  end

  def delete(user) do
    case user |> Repo.delete() do
      {:ok, deleted} -> {:ok, deleted}
    end
  end
end
