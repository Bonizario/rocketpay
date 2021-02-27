use Mix.Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :rocketpay, Rocketpay.Repo,
  username: System.get_env("POSTGRES_USERNAME", "postgres"),
  password: System.get_env("POSTGRES_PASSWORD", "0000"),
  database: "rocketpay_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  port: 5432,
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :rocketpay, RocketpayWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
