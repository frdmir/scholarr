defmodule ScholarrWeb.CategoryController do
  use ScholarrWeb, :controller
  alias Scholarr.Repo
  alias Scholarr.Courses.Category

  def index(conn, %{"category" => category}) do
    index =
      Repo.get_by!(Category, %{url: category})
      |> Repo.preload([:course, subcategory: [:course]])

    render(conn, :index, category: index)
  end
end
