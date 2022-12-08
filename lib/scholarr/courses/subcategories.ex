defmodule Scholarr.Courses.Subcategory do
  use Scholarr.Schema
  import Ecto.Changeset

  @primary_key {:id, :string, autogenerate: {Ecto.Nanoid, :gen, [:string]}}
  schema "subcategory" do
    field :title, :string
    field :url, :string

    belongs_to :category, Scholarr.Courses.Category

    timestamps()
  end

  @required_values [:title, :url, :category_id]
  @optional_values []
  @doc false
  def changeset(subcategory, attrs) do
    subcategory
    |> cast(attrs, @required_values, @optional_values)
    |> validate_required([:title, :category_id])
    |> Scholarr.Courses.Category.trim()
  end
end
