defmodule TodoApi.Umbrella.MixProject do
  use Mix.Project

  @source_url "https://github.com/JackMortDT/to-do_api"
  @version "0.1.0"

  def project do
    [
      apps_path: "apps",
      version: @version,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.html": :test
      ],
      dialyzer: [
        flags: [:unmatched_returns, :error_handling, :underspecs, :unknown],
        ignore_warnings: ".dialyzer_ignore.exs",
        list_unused_filters: true
      ],
      docs: docs(),
      package: package()
    ]
  end

  defp deps do
    [
      # dev deps
      {:credo, "~> 1.6.7", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.2.0", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.29.1", only: :dev, runtime: false},
      {:git_hooks, "~> 0.7.3", only: [:dev], runtime: false},
      # test deps
      {:excoveralls, "~> 0.14.5", only: :test},
      {:faker, "~> 0.17", only: :test},
      {:mock, "~> 0.3.7", only: :test}
    ]
  end

  defp aliases do
    [
      setup: ["cmd mix setup"]
    ]
  end

  defp docs do
    [
      main: "readme",
      source_url: @source_url,
      source_ref: "v#{@version}",
      logo: "assets/todo-logo.png"
    ]
  end

  defp package do
    [
      maintainers: ["Luis Sastré luis.sastre.dev@gmail.com"],
      links: %{github: @source_url}
    ]
  end
end
