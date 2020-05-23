# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :blockapp,
  ecto_repos: [Blockapp.Repo]

# Configures the endpoint
config :blockapp, BlockappWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ptEaH5FQqxqtAvwTKyZBBcKM3J0iDghCyDQ3r+JKDMBQY8UhZ8ShZRFwXPZU/l7k",
  render_errors: [view: BlockappWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Blockapp.PubSub,
  live_view: [signing_salt: "eh1t+Mnd"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :ueberauth, Ueberauth,
  providers: [
    identity:
      {Ueberauth.Strategy.Identity,
       [
         param_nesting: "account",
         request_path: "/register",
         callback_path: "/register",
         callback_methods: ["POST"]
       ]}
  ]

  config :yauth, BlockappWeb.Authentication,
  issuer: "blockapp",
  secret_key: System.get_env("pA5GSsA/EQ1OaeZKOTgp4LNxprqMlpezxJKODQmsFcgh5wv245GH3Y4cB9N5fx8J")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
