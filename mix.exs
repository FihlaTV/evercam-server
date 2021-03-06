defmodule EvercamMedia.Mixfile do
  use Mix.Project

  def project do
    [app: :evercam_media,
     version: "1.0.1",
     elixir: "~> 1.4.1",
     elixirc_paths: elixirc_paths(Mix.env),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     compilers: [:phoenix] ++ Mix.compilers,
     aliases: aliases(),
     deps: deps()]
  end

  defp aliases do
    [clean: ["clean"]]
  end

  def application do
    [mod: {EvercamMedia, []},
     applications: app_list(Mix.env)]
  end

  defp app_list(:dev), do: [:dotenv, :credo | app_list()]
  defp app_list(:test), do: [:dotenv | app_list()]
  defp app_list(_), do: app_list()
  defp app_list, do: [
    :calendar,
    :cf,
    :comeonin,
    :con_cache,
    :connection,
    :cors_plug,
    :cowboy,
    :ecto,
    :geo,
    :httpoison,
    :inets,
    :jsx,
    :mailgun,
    :meck,
    :phoenix,
    :phoenix_ecto,
    :phoenix_html,
    :phoenix_pubsub,
    :porcelain,
    :postgrex,
    :quantum,
    :runtime_tools,
    :timex,
    :tzdata,
    :erlware_commons,
    :uuid,
    :xmerl,
    :html_sanitize_ex,
    :new_relic,
    :jazz,
    :gen_stage,
  ]

  # Specifies which paths to compile per environment
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  defp deps do
    [
      {:calendar, "~> 0.17.2"},
      {:comeonin, "~> 3.0.2"},
      {:con_cache, "~> 0.12.0"},
      {:cors_plug, "~> 1.2.1"},
      {:cowboy, "~> 1.1.2"},
      {:credo, "~> 0.7.4", only: :dev},
      {:dotenv, "~> 2.1.0", only: [:dev, :test]},
      {:ecto, "~> 2.1.4"},
      {:exrm, "~> 1.0.8"},
      {:geo, "~> 1.4"},
      {:httpoison, "== 0.11.1", override: true},
      {:jsx, "~> 2.8.2", override: true},
      {:mailgun, github: "evercam/mailgun"},
      {:phoenix, "~> 1.3.0", override: true},
      {:phoenix_ecto, "~> 3.2.3"},
      {:phoenix_html, "~> 2.9.3"},
      {:porcelain, "~> 2.0.3"},
      {:postgrex, ">= 0.13.2"},
      {:quantum, "~> 1.9.2"},
      {:uuid, "~> 1.1.7"},
      {:relx, "~> 3.22.4"},
      {:erlware_commons, "~> 1.0.0", override: true},
      {:cf, "~> 0.2.2", override: true},
      {:exvcr, "~> 0.8.9", only: :test},
      {:meck,  "~> 0.8.4", override: :true},
      {:html_sanitize_ex, "~> 1.2.0"},
      {:new_relic, github: "azharmalik3/newrelic-elixir", override: true},
      {:jazz, "~> 0.2.1"},
      {:gen_stage, "~> 0.11"},
    ]
  end
end
