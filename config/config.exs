import Config

config :stuff,
       Stuff.Repo,
       database: "stuff_repo",
       username: "postgres",
       password: "postgres",
       hostname: "localhost"

config :stuff, ecto_repos: [Stuff.Repo]
