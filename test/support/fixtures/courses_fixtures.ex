defmodule Scholarr.CoursesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Scholarr.Courses` context.
  """

  @doc """
  Generate a course.
  """
  def course_fixture(attrs \\ %{}) do
    {:ok, course} =
      attrs
      |> Enum.into(%{
        title: "some title"
      })
      |> Scholarr.Courses.create_category()

    course
  end

  @doc """
  Generate a subcategories.
  """
  def subcategories_fixture(attrs \\ %{}) do
    {:ok, subcategories} =
      attrs
      |> Enum.into(%{
        title: "some title"
      })
      |> Scholarr.Courses.create_subcategories()

    subcategories
  end
end
