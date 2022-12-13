defmodule Scholarr.Courses.Course do
  use Scholarr.Schema
  import Ecto.Changeset

  @primary_key {:id, :string, autogenerate: {Ecto.Nanoid, :gen, [:string]}}
  schema "course" do
    field :display_name, :string
    field :videos, :string, default: "0"
    field :thumbnail_link, :string, default: "#"
    field :thumbnail_version, :string, default: "0"

    many_to_many :category, Scholarr.Courses.Category,
      join_through: "course_category",
      on_replace: :delete

    many_to_many :subcategory, Scholarr.Courses.Subcategory,
      join_through: "course_subcategory",
      on_replace: :delete

    has_one :folder, Scholarr.Filesystem.Folder

    timestamps()
  end

  @param_fields [
    :display_name,
    :videos,
    :thumbnail_link,
    :thumbnail_version
  ]
  @required_fields [
    :display_name,
    :videos,
    :thumbnail_link,
    :thumbnail_version
  ]
  @optional_fields []
  @doc false
  def changeset(course, attrs) do
    course
    |> cast(attrs, @param_fields, @optional_fields)
    |> validate_required(@required_fields)
  end
end
