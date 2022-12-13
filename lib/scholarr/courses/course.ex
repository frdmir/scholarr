defmodule Scholarr.Courses.Course do
  use Scholarr.Schema
  import Ecto.Changeset

  @primary_key {:id, :string, autogenerate: {Ecto.Nanoid, :gen, [:string]}}
  schema "course" do
    field :display_name, :string
    field :videos, :string
    field :thumbnail_link, :string
    field :thumbnail_version, :string

    has_one :category, Scholarr.Courses.Category

    many_to_many :subcategory, Scholarr.Courses.Subcategory,
      join_through: "course_subcategory",
      on_replace: :delete

    has_one :folder, Scholarr.Sources.Folder

    timestamps()
  end

  @param_fields [
    :display_name,
    :videos,
    :thumbnail_link,
    :thumbnail_version,
    :category_id,
    :subcategory_id,
    :folder_id
  ]
  @required_fields [
    :display_name,
    :videos,
    :thumbnail_link,
    :thumbnail_version,
    :category_id,
    :subcategory_id,
    :folder_id
  ]
  @optional_fields []
  @doc false
  def changeset(course, attrs) do
    course
    |> cast(attrs, @param_fields, @optional_fields)
    |> validate_required(@required_fields)
  end
end
