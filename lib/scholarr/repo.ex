defmodule Scholarr.Repo do
  use Ecto.Repo,
    otp_app: :scholarr,
    adapter: Ecto.Adapters.Postgres
end
