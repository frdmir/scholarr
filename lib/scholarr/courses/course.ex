defmodule Scholarr.Courses.Course do
  use Scholarr.Schema
  import Ecto.Changeset

  @primary_key {:id, :string, autogenerate: {Ecto.Nanoid, :gen, [:string]}}
  schema "course" do
    field :description, :string
    field :display_name, :string
    field :files, :integer, default: 0
    field :folders, :integer, default: 0
    field :hours, :integer, default: 0
    field :size, :integer, default: 0
    field :thumbnail, :boolean, default: false
    field :thumbnail_path, :string
    field :thumbnail_version, :string, default: "0"
    field :topic, :string, default: ""
    field :videos, :string, default: "0"
    field :videos_played, :string, default: "0"
    field :url, :string

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
    :description,
    :display_name,
    :files,
    :folders,
    :hours,
    :size,
    :thumbnail,
    :thumbnail_path,
    :thumbnail_version,
    :topic,
    :videos,
    :videos_played,
    :url
  ]
  @required_fields [
    :display_name,
    :videos,
    :thumbnail,
    :thumbnail_version
  ]
  @optional_fields []
  @doc false
  def changeset(course, attrs) do
    course
    |> cast(attrs, @param_fields, @optional_fields)
    |> validate_required(@required_fields)
    |> Scholarr.Courses.Category.trim()
  end
end
