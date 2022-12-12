defmodule Scholarr.Courses.Course do
  use Ecto.Schema
  import Ecto.Changeset

  schema "course" do
    field :display_name, :string

    timestamps()
  end

  @doc false
  def changeset(course, attrs) do
    course
    |> cast(attrs, [:display_name])
    |> validate_required([:display_name])
  end
end
