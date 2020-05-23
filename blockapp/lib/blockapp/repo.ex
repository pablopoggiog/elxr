defmodule Blockapp.Repo do
  use Ecto.Repo,
    otp_app: :blockapp,
    adapter: Ecto.Adapters.Postgres
end
