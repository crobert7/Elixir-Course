use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :api_user, ApiUserWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :api_user, ApiUser.Repo,
  username: "postgres",
  password: "postgres",
  database: "api_user_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
