use Mix.Config

config :address_validator_api, AddressValidatorApi.Repo, [
  adapter: Ecto.Adapters.Postgres,
  database: "address_validator_test",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
]