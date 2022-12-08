defmodule Scholarr.Courses.Category do
  use Scholarr.Schema
  import Ecto.Changeset

  @primary_key {:id, :string, autogenerate: {Ecto.Nanoid, :gen, [:string]}}
  schema "category" do
    field :title, :string
    field :url, :string

    has_many :subcategory, Scholarr.Courses.Subcategory
    timestamps()
  end

  @required_fields [:title, :url]
  @optional_fields []
  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, @required_fields, @optional_fields)
    |> validate_required([:title])
    |> trim()
  end

  def trim(changeset) do
    url =
      remove_whitespace(get_change(changeset, :title))
      |> remove_slash()
      |> String.downcase()

    put_change(changeset, :url, url)
  end

  defp remove_whitespace(string), do: Regex.replace(~r/\s+/, string, "_")

  defp remove_slash(string), do: Regex.replace(~r/\/+/, string, "_")
end
