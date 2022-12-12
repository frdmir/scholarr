defmodule Scholarr.CoursesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Scholarr.Courses` context.
  """

  @doc """
  Generate a category.
  """
  def category_fixture(attrs \\ %{}) do
    {:ok, category} =
      attrs
      |> Enum.into(%{
        display_name: "some display_name"
      })
      |> Scholarr.Courses.create_category()

    category
  end

  @doc """
  Generate a subcategories.
  """
  def subcategories_fixture(attrs \\ %{}) do
    {:ok, subcategories} =
      attrs
      |> Enum.into(%{
        display_name: "some display_name"
      })
      |> Scholarr.Courses.create_subcategory()

    subcategories
  end

  @doc """
  Generate a course.
  """
  def course_fixture(attrs \\ %{}) do
    {:ok, course} =
      attrs
      |> Enum.into(%{
        display_name: "some display_name"
      })
      |> Scholarr.Courses.create_course()

    course
  end
end
