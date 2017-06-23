# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :address_validation_rest, AddressValidationRest.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "TY11cGHYSlfZVhnfdlK38m5jrYJ2txpYvrXBCwhuzo9q8aXp39vtQngHk0vva8Lp",
  render_errors: [view: AddressValidationRest.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AddressValidationRest.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
