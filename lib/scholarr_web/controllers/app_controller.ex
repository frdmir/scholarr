defmodule ScholarrWeb.AppController do
  use ScholarrWeb, :controller
  alias Scholarr.Courses

  def index(conn, _params) do
    render(conn, :index, courses: Courses.list_course() |> Enum.sort_by(& &1.updated_at, :asc))
  end

  def app(conn, _params) do
    # IO.inspect(conn, label: "app")
    render(conn, :app, fred2: "fred2")
  end
end
