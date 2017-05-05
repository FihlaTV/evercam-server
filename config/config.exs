# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

config :hackney,
  :timeout, 15000

# Configures the endpoint
config :evercam_media, EvercamMedia.Endpoint,
  check_origin: false,
  url: [host: "localhost"],
  secret_key_base: "joIg696gDBw3ZjdFTkuWNz7s21nXrcRUkZn3Lsdp7pCNodzCMl/KymikuJVw0igG",
  debug_errors: false,
  server: true,
  root: Path.expand("..", __DIR__),
  pubsub: [name: EvercamMedia.PubSub,
           adapter: Phoenix.PubSub.PG2],
  instrumenters: [Appsignal.Phoenix.Instrumenter]

config :evercam_media,
  ecto_repos: [EvercamMedia.Repo]

config :evercam_media,
  mailgun_domain: System.get_env("MAILGUN_DOMAIN"),
  mailgun_key: System.get_env("MAILGUN_KEY")

config :evercam_media,
  ftp_domain: System.get_env("FTP_DOMAIN") |> to_char_list,
  ftp_username: System.get_env("FTP_USERNAME") |> to_char_list,
  ftp_password: System.get_env("FTP_PASSWORD") |> to_char_list

config :logger, :console,
  format: "$date $time $metadata[$level] $message\n",
  metadata: [:request_id]

config :evercam_media,
  hls_url: "http://localhost:8080/hls"

config :evercam_media,
  storage_dir: "storage"

config :evercam_media,
  seaweedfs_url: "http://localhost:8888"

config :evercam_media, :mailgun,
  domain: "sandbox",
  key: "sandbox",
  mode: :test,
  test_file_path: "priv_dir/mailgun_test.json"

config :appsignal, :config,
  active: true,
  name: "Evercam Staging",
  push_api_key: System.get_env("APP_SIGNAL_KEY"),
  env: Mix.env

config :phoenix, :template_engines,
  eex: Appsignal.Phoenix.Template.EExEngine,
  exs: Appsignal.Phoenix.Template.ExsEngine

config :evercam_media, EvercamMedia.Repo,
  loggers: [Appsignal.Ecto, Ecto.LogEntry]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
