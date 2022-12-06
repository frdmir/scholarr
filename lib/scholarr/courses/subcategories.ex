defmodule Scholarr.Courses.Subcategory do
  alias Scholarr.Courses.Category
  use Scholarr.Schema
  import Ecto.Changeset

  @primary_key {:id, :string, autogenerate: {Ecto.Nanoid, :gen, [:string]}}
  schema "subcategory" do
    field :title, :string
    belongs_to :category, Category

    timestamps()
  end

  @doc false
  def changeset(subcategory, attrs) do
    subcategory
    |> cast(attrs, [:title, :category_id])
    |> validate_required([:title, :category_id])
  end
end
