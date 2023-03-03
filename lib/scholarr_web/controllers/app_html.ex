defmodule ScholarrWeb.AppHTML do
  use ScholarrWeb, :html
  import ScholarrWeb.AppComponents

  embed_templates "app_html/*"

  def teste do
    IO.puts("SDASDSADA")
  end
end
