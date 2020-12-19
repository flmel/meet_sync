defmodule MeetSync.Meetings.Meeting do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "meetings" do
    field :end_time, :utc_datetime
    field :start_time, :utc_datetime
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(meeting, attrs) do
    meeting
    |> cast(attrs, [:title, :start_time, :end_time])
    |> validate_required([:title])
  end
end
