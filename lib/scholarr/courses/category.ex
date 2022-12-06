defmodule Scholarr.Courses.Category do
  use Scholarr.Schema
  import Ecto.Changeset

  @primary_key {:id, :string, autogenerate: {Ecto.Nanoid, :gen, [:string]}}
  schema "category" do
    field :title, :string
    field :category, :string

    has_many :subcategory, Scholarr.Courses.Subcategory
    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
