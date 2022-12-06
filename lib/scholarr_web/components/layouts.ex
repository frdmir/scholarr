defmodule ScholarrWeb.Layouts do
  alias Scholarr.Courses
  use ScholarrWeb, :html
  import ScholarrWeb.AppComponents
  alias Scholarr.Courses

  embed_templates "layouts/*"

  def title() do
    Courses.list_categories()
  end
end
