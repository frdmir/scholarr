defmodule Scholarr.Courses.Subcategory do
  use Scholarr.Schema
  import Ecto.Changeset

  @primary_key {:id, :string, autogenerate: {Ecto.Nanoid, :gen, [:string]}}
  schema "subcategory" do
    field :display_name, :string
    field :url, :string

    belongs_to :category, Scholarr.Courses.Category

    many_to_many :course, Scholarr.Courses.Course,
      join_through: "course_subcategory",
      on_replace: :delete

    timestamps()
  end

  @param_values [:display_name, :url, :category_id]
  @required_values [:display_name, :category_id]
  @optional_values []
  @doc false
  def changeset(subcategory, attrs) do
    subcategory
    |> cast(attrs, @param_values, @optional_values)
    |> validate_required(@required_values)
    |> Scholarr.Courses.Category.trim()
  end
end
