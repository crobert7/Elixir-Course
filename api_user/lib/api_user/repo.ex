defmodule ApiUser.Repo do
  use Ecto.Repo,
    otp_app: :api_user,
    adapter: Ecto.Adapters.Postgres
end
