defmodule Stuff.MixProject do
  use Mix.Project

  def project do
    [
      app: :stuff,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Stuff.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # dev
      {:remix, "~> 0.0.2", only: :dev},
      {:dialyxir, "~> 1.0.0-rc.6", only: [:dev], runtime: false},
    ]
  end
end
