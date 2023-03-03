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

  defp aliases do
    [
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
