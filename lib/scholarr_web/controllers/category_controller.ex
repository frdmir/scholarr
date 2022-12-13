defmodule ScholarrWeb.CategoryController do
  use ScholarrWeb, :controller
  alias Scholarr.Repo
  alias Scholarr.Courses
  alias Scholarr.Courses.Category

  def index(conn, %{"category" => category}) do
    index =
      Repo.get_by!(Category, %{url: category})
      |> Repo.preload(:subcategory)

    render(conn, :index, category: index)
  end

  def show(conn, %{"category" => category}) do
    category = Courses.get_category_url(category)
    render(conn, :show, category: category)
  end
end
