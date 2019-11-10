defmodule Stuff.Repo do
  use Ecto.Repo,
    otp_app: :stuff,
    adapter: Ecto.Adapters.Postgres
end
