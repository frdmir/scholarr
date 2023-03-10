defmodule Scholarr.Seeds do
  # Script for populating the database. You can run it as:
  #
  #     mix run priv/repo/seeds.exs
  #
  # Inside the script, you can read and write to any of your
  # repositories directly:
  #
  #     Scholarr.Repo.insert!(%Scholarr.SomeSchema{})
  #
  # We recommend using the bang functions (`insert!`, `update!`
  # and so on) as they will fail if something goes wrong.
  # alias Scholarr.Repo
  alias Scholarr.Courses
  alias Scholarr.Filesystem
  alias Scholarr.Filesystem.Folder
  # alias Scholarr.Courses.{Category, Subcategory}
  def seed do
    cats = [
      %{display_name: "Business"},
      %{display_name: "Design"},
      %{display_name: "Development"},
      %{display_name: "Music & Audio"},
      %{display_name: "UI/UX"},
      %{display_name: "Photo & Video"},
      %{display_name: "3D & Motion Graphic"},
      %{display_name: "Uncategorized"}
    ]

    subs = [
      %{display_name: "Graphic Design"},
      %{display_name: "Illustration"},
      %{display_name: "Vector"},
      %{display_name: "Digital Painting"},
      %{display_name: "Photo Manipulation"},
      %{display_name: "Print Design"}
    ]

    Enum.each(cats, &Courses.create_category(&1))

    design =
      Courses.list_category()
      |> Enum.filter(&(&1.display_name == "Design"))
      |> List.first()

    Enum.each(subs, &Courses.create_subcategory(Map.merge(&1, %{category_id: design.id})))

    Filesystem.Folder.changeset(
      %Folder{},
      %{
        "folder_name" => "root",
        "folder_path" => "/media/cursos",
        "folder_id" => "root"
      },
      true
    )
    |> Repo.insert()

    Scholarr.Helpers.file_scanner()
  end
end
