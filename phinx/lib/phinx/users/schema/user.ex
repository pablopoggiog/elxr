defmodule Phinx.Users.Schema.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "User" do
    field :name, :string
    field :email, :string
    field :password, Phinx.Encrypted.Binary
    field :password_hash, Cloak.Ecto.SHA256
    field :token, :string

    # timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:id, :name, :email, :token])
    |> validate_required([:name, :email])
    |> unique_constraint(:email)
    |> put_hashed_fields()
  end

  defp put_hashed_fields(changeset) do
    changeset
    |> put_change(:password_hash, get_field(changeset, :password))
  end
end
