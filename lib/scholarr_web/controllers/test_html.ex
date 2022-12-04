defmodule ScholarrWeb.TestHTML do
  use ScholarrWeb, :html

  embed_templates "test_html/*"

  def title(assigns) do
    ~H"""

    """
  end
end
