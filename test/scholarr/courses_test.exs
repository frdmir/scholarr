defmodule Scholarr.CoursesTest do
  use Scholarr.DataCase

  alias Scholarr.Courses

  describe "courses" do
    alias Scholarr.Courses.Course

    import Scholarr.CoursesFixtures

    @invalid_attrs %{title: nil}

    test "list_courses/0 returns all courses" do
      course = course_fixture()
      assert Courses.list_courses() == [course]
    end

    test "get_course!/1 returns the course with given id" do
      course = course_fixture()
      assert Courses.get_course!(course.id) == course
    end

    test "create_category/1 with valid data creates a course" do
      valid_attrs = %{title: "some title"}

      assert {:ok, %Course{} = course} = Courses.create_category(valid_attrs)
      assert course.title == "some title"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Courses.create_category(@invalid_attrs)
    end

    test "update_course/2 with valid data updates the course" do
      course = course_fixture()
      update_attrs = %{title: "some updated title"}

      assert {:ok, %Course{} = course} = Courses.update_course(course, update_attrs)
      assert course.title == "some updated title"
    end

    test "update_course/2 with invalid data returns error changeset" do
      course = course_fixture()
      assert {:error, %Ecto.Changeset{}} = Courses.update_course(course, @invalid_attrs)
      assert course == Courses.get_course!(course.id)
    end

    test "delete_course/1 deletes the course" do
      course = course_fixture()
      assert {:ok, %Course{}} = Courses.delete_course(course)
      assert_raise Ecto.NoResultsError, fn -> Courses.get_course!(course.id) end
    end

    test "change_course/1 returns a course changeset" do
      course = course_fixture()
      assert %Ecto.Changeset{} = Courses.change_course(course)
    end
  end

  describe "subcategories" do
    alias Scholarr.Courses.Subcategories

    import Scholarr.CoursesFixtures

    @invalid_attrs %{title: nil}

    test "list_subcategories/0 returns all subcategories" do
      subcategories = subcategories_fixture()
      assert Courses.list_subcategories() == [subcategories]
    end

    test "get_subcategories!/1 returns the subcategories with given id" do
      subcategories = subcategories_fixture()
      assert Courses.get_subcategories!(subcategories.id) == subcategories
    end

    test "create_subcategories/1 with valid data creates a subcategories" do
      valid_attrs = %{title: "some title"}

      assert {:ok, %Subcategories{} = subcategories} = Courses.create_subcategories(valid_attrs)
      assert subcategories.title == "some title"
    end

    test "create_subcategories/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Courses.create_subcategories(@invalid_attrs)
    end

    test "update_subcategories/2 with valid data updates the subcategories" do
      subcategories = subcategories_fixture()
      update_attrs = %{title: "some updated title"}

      assert {:ok, %Subcategories{} = subcategories} =
               Courses.update_subcategories(subcategories, update_attrs)

      assert subcategories.title == "some updated title"
    end

    test "update_subcategories/2 with invalid data returns error changeset" do
      subcategories = subcategories_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Courses.update_subcategories(subcategories, @invalid_attrs)

      assert subcategories == Courses.get_subcategories!(subcategories.id)
    end

    test "delete_subcategories/1 deletes the subcategories" do
      subcategories = subcategories_fixture()
      assert {:ok, %Subcategories{}} = Courses.delete_subcategories(subcategories)
      assert_raise Ecto.NoResultsError, fn -> Courses.get_subcategories!(subcategories.id) end
    end

    test "change_subcategories/1 returns a subcategories changeset" do
      subcategories = subcategories_fixture()
      assert %Ecto.Changeset{} = Courses.change_subcategories(subcategories)
    end
  end
end
