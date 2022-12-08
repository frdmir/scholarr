defmodule Scholarr.Repo.Migrations.CreateSubcategory do
  use Ecto.Migration

  def change do
    create table(:subcategory, primary_key: false) do
      add :id, :string, primary_key: true
      add :title, :string
      add :url, :string

      add :category_id, references(:category, type: :string)
      timestamps()
    end

    create unique_index(:subcategory, [:title])
  end
end
