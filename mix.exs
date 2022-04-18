defmodule LmHttp.MixProject do
  use Mix.Project

  @source_url "https://github.com/LucidModules/elixir-http"
  @version "0.2.0"

  def project do
    [
      app: :lm_http,
      version: @version,
      elixir: "~> 1.13",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Hex
      description:
        "An HTTP API as a template for other libraries. Standardizes 3rd party API integrations.",
      package: package(),

      # Docs
      name: "Lucid Modules HTTP",
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.1", only: :dev},
      {:earmark, ">= 0.0.0", only: :dev},
      {:credo, ">= 0.0.0", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false},
      {:mock, "~> 0.3", only: :test},
      {:mix_test_watch, "~> 0.8", only: :dev, runtime: false},
      {:floki, ">= 0.30.0", only: :test}
    ]
  end

  defp package do
    [
      name: "lm_http",
      maintainers: ["Matt Chad"],
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => @source_url}
    ]
  end

  defp docs do
    [
      name: "Lucid Modules HTTP",
      source_url: @source_url,
      homepage_url: @source_url
    ]
  end
end
