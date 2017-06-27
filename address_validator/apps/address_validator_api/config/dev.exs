use Mix.Config

config :address_validator_api, google_api_key: "AIzaSyCkwyRpvYKMnWX0JoR7VoO4oDNUhI5UWJQ"
config :address_validator_api, google_api_url: "https://maps.googleapis.com/maps/api/geocode/json"


# Configure your database
config :address_validator_api, AddressValidatorApi.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "address_validator_dev",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  port: 5432,
  pool_size: 10