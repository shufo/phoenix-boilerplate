use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_boilerplate, PhoenixBoilerplate.Endpoint,
  http: [port: 4001],
  server: true

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :phoenix_boilerplate, PhoenixBoilerplate.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: "root",
  password: "root",
  database: "phoenix_test",
  hostname: System.get_env("MYSQL_HOST") || "mysql",
  pool_size: 10,
  pool: Ecto.Adapters.SQL.Sandbox
