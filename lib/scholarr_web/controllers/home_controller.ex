defmodule ScholarrWeb.HomeController do
  use ScholarrWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end
end
