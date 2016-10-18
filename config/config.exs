# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_boilerplate,
  ecto_repos: [PhoenixBoilerplate.Repo]

# Configures the endpoint
config :phoenix_boilerplate, PhoenixBoilerplate.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "mtwhaYo0dKXBNc0TYM02awFR+C+95SUn7ZVRHJSogmUTNcYoYHnuDz5lntW5B/dv",
  render_errors: [view: PhoenixBoilerplate.ErrorView, accepts: ~w(html json)],
  pubsub: [name: StreamingChat.PubSub,
           adapter: Phoenix.PubSub.Redis,
           host: System.get_env("REDIS_HOST") || "redis"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :plug_session_redis, :config,
  name: :redis_sessions,
  pool: [size: 2, max_overflow: 5],
  redis: [host: System.get_env("REDIS_HOST") || 'redis', port: 6379]

config :hound,
  driver: "phantomjs",
  host: System.get_env("PHANTOMJS_HOST") || "phantomjs",
  port: 8910

config :redix,
  host: System.get_env("REDIS_HOST") || "redis"
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
