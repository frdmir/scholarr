defmodule Scholarr.Courses.CourseSubcategory do
  use Scholarr.Schema
  import Ecto.Changeset

  @primary_key false
  schema "course_subcategory" do
    belongs_to :course, Scholarr.Courses.Course
    belongs_to :subcategory, Scholarr.Courses.Subcategory

    timestamps()
  end

  @param_fields [
    :course_id,
    :subcategory_id
  ]
  @required_fields [
    :course_id,
    :subcategory_id
  ]
  @optional_fields []
  @doc false
  def changeset(course_subcategory, attrs) do
    course_subcategory
    |> cast(attrs, @param_fields, @optional_fields)
    |> validate_required(@required_fields)
  end
end
