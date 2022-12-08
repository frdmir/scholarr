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
# alias Scholarr.Courses.{Category, Subcategory}

cats = [
  %{title: "Business"},
  %{title: "Design"},
  %{title: "Development"},
  %{title: "Music & Audio"},
  %{title: "UI/UX"},
  %{title: "Photo & Video"},
  %{title: "3D & Motion Graphic"}
]

subs = [
  %{title: "Graphic Design"},
  %{title: "Illustration"},
  %{title: "Vector"},
  %{title: "Digital Painting"},
  %{title: "Photo Manipulation"},
  %{title: "Print Design"}
]

Enum.each(cats, &Courses.create_category(&1))

design =
  Courses.list_category()
  |> Enum.filter(&(&1.title == "Design"))
  |> List.first()

Enum.each(subs, &Courses.create_subcategory(Map.merge(&1, %{category_id: design.id})))
