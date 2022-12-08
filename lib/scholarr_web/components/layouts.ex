defmodule ScholarrWeb.Layouts do
  use ScholarrWeb, :html
  import ScholarrWeb.AppComponents
  alias Scholarr.Courses
  alias Scholarr.Repo

  embed_templates "layouts/*"

  def categories() do
    Courses.list_category()
    |> Repo.preload(:subcategory)
  end
end
