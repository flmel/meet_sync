defmodule MeetSync.Repo do
  use Ecto.Repo,
    otp_app: :meet_sync,
    adapter: Ecto.Adapters.Postgres
end
