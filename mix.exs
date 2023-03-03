defmodule TodoApi.Umbrella.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      version: "0.1.0",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      test_coverage: [tool: ExCoveralls],
      dialyzer: [
        flags: [:unmatched_returns, :error_handling, :underspecs, :unknown],
        ignore_warnings: ".dialyzer_ignore.exs",
        list_unused_filters: true
      ]
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options.
  #
  # Dependencies listed here are available only for this project
  # and cannot be accessed from applications inside the apps/ folder.
  defp deps do
    [
      # dev deps
      {:credo, "~> 1.6.7", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.2.0", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.29.1", only: :dev, runtime: false},
      {:git_hooks, "~> 0.7.3", only: [:dev], runtime: false},
      # test deps
      {:excoveralls, "~> 0.14.5", only: :test},
      {:ex_machina, "~> 2.7", only: :test},
      {:faker, "~> 0.17", only: :test}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  #
  # Aliases listed here are available only for this project
  # and cannot be accessed from applications inside the apps/ folder.
  defp aliases do
    [
      # run `mix setup` in all child apps
      setup: ["cmd mix setup"]
    ]
  end

  defp package do
    [
      maintainers: ["Luis Sastré luis.sastre.dev@gmail.com"],
      links: %{github: @source_url}
    ]
  end
end
