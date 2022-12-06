defmodule ScholarrWeb.AppController do
  use ScholarrWeb, :controller

  def index(conn, _params) do
    IO.puts("APP INDEX")
    render(conn, :index, fred: "fred")
    # IO.inspect(conn, label: "index")
  end

  def app(conn, _params) do
    # IO.inspect(conn, label: "app")
    IO.puts("APP APP")
    render(conn, :app, fred2: "fred2")
  end
end
