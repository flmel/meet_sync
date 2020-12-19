defmodule MeetSync.Repo.Migrations.CreateMeetings do
  use Ecto.Migration

  def change do
    create table(:meetings, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :start_time, :utc_datetime
      add :end_time, :utc_datetime

      timestamps()
    end

  end
end
