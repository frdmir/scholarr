defmodule ScholarrWeb.Dashboard.DashboardLive do
  use ScholarrWeb, :live_view
  import ScholarrWeb.AppComponents
  alias Scholarr.Courses
  alias Scholarr.Repo

  def mount(_params, _session, socket) do
    assigns =
      socket
      |> assign(courses: Courses.list_course() |> Enum.sort_by(& &1.updated_at, :asc))
      |> assign(
        categories:
          Courses.list_category()
          |> Repo.preload(:subcategory)
      )

    IO.inspect(socket, limit: :infinity)
    {:ok, assigns}
  end

  def handle_params(_params, url, socket) do
    IO.puts(url)

    assigns =
      socket
      |> assign(current_path: url)

    {:noreply, assigns}
  end

  def handle_event("teste", _, socket) do
    Scholarr.Helpers.file_scanner()
    {:noreply, socket}
  end
end
