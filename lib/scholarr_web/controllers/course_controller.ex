defmodule ScholarrWeb.CourseController do
  use ScholarrWeb, :controller
  # use Phoenix.Component
  alias Scholarr.Courses

  def index(conn, _params) do
    render(conn, :index)
  end

  def show(conn, %{"course" => course}) do
    course = Courses.get_course_url(course)
    # live_render(conn, ScholarrWeb.Course.CourseLive)
    render(conn, :show, course: course)
  end
end
