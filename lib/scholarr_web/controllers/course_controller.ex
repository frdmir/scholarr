defmodule ScholarrWeb.CourseController do
  use ScholarrWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end

  def show(conn, %{"category" => category}) do
    render(conn, :show, category: category)
  end
end
