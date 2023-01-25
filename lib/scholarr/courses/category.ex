defmodule Scholarr.Courses.Category do
  use Scholarr.Schema
  import Ecto.Changeset

  @primary_key {:id, :string, autogenerate: {Ecto.Nanoid, :gen, [:string]}}
  schema "category" do
    field :display_name, :string
    field :url, :string

    has_many :subcategory, Scholarr.Courses.Subcategory

    many_to_many :course, Scholarr.Courses.Course,
      join_through: "course_category",
      on_replace: :delete

    timestamps()
  end

  @required_fields [:display_name, :url]
  @optional_fields []
  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, @required_fields, @optional_fields)
    |> validate_required([:display_name])
    |> trim()
  end

  def trim(changeset) do
    case get_change(changeset, :display_name) do
      nil ->
        changeset

      display_name ->
        url =
          remove_whitespace(display_name)
          |> remove_slash()
          |> String.downcase()

        put_change(changeset, :url, url)
    end
  end

  defp remove_whitespace(string),
    do: Regex.replace(~r/\s+/, string, "_")

  defp remove_slash(string), do: Regex.replace(~r/\/+/, string, "_")
end
