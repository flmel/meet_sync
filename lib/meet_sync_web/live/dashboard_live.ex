defmodule MeetSyncWeb.DashboardLive do
  @moduledoc false
  use MeetSyncWeb, :live_view
  alias MeetSync.Meetings
  alias MeetSync.Meetings.Meeting

  @impl true
  def mount(_params, _session, socket) do
    meetings = Meetings.list_meetings()

    {:ok, assign(socket, meetings: meetings, changeset: nil)}
  end

  @impl true
  def handle_event("create_meeting", _params, socket) do
    changeset = Meetings.change_meeting(%Meeting{})

    socket = assign(socket, changeset: changeset)

    {:noreply, socket}
  end

  def handle_event("cancel_create", _params, socket) do
    socket = assign(socket, changeset: nil)
    {:noreply, socket}
  end

  def handle_event("save_meeting", %{"meeting" => form_params}, socket) do
    case Meetings.create_meeting(form_params) do
      {:ok, meeting} ->
        socket = update(socket, :meetings, fn meetings -> [meeting | meetings] end)
        socket = assign(socket, changeset: false)
        {:noreply, socket}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
