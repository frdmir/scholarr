defmodule Scholarr.Courses.CourseCategory do
  use Scholarr.Schema
  import Ecto.Changeset

  alias Scholarr.Courses
  @primary_key false
  schema "course_category" do
    belongs_to :course, Courses.Course
    belongs_to :category, Courses.Category

    timestamps()
  end

  @doc false
  def create_course_in_category(course, category) do
    %Courses.Course{}
    |> Courses.Course.changeset(course)
    |> put_assoc(:category, [category])
  end

  def update_course_in_category(course, category) do
    category
    |> change()
    |> put_assoc(:course, [course])
  end
end
