defmodule ScholarrWeb.SubcategoryController do
  use ScholarrWeb, :controller

  def index(conn, %{"subcategory" => subcategory}) do
    render(conn, :index, subcategory: Scholarr.Courses.get_subcategory_url(subcategory))
  end

  def show(conn, %{"subcategory" => subcategory}) do
    render(conn, :show, subcategory: Scholarr.Courses.get_subcategory_url(subcategory))
  end
end
