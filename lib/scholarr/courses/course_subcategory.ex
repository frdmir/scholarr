defmodule Scholarr.Courses.CourseSubcategory do
  use Scholarr.Schema
  import Ecto.Changeset
  alias Scholarr.Courses

  @primary_key false
  schema "course_subcategory" do
    belongs_to :course, Scholarr.Courses.Course
    belongs_to :subcategory, Scholarr.Courses.Subcategory

    timestamps()
  end

  def create_course_in_subcategory(course, subcategory) do
    %Courses.Course{}
    |> Courses.Course.changeset(course)
    |> put_assoc(:subcategory, [subcategory])
  end

  def update_course_in_subcategory(course, subcategory) do
    subcategory
    |> change()
    |> put_assoc(:course, [course])
  end
end
