defmodule Scholarr.Repo.Migrations.CreateTableSubcategory do
  use Ecto.Migration

  def change do
    create table(:subcategory, primary_key: false) do
      add :id, :string, primary_key: true
      add :display_name, :string, null: false
      add :url, :string

      add :category_id, references(:category, type: :string), null: false
      timestamps()
    end

    create unique_index(:subcategory, [:id, :display_name])
  end
end
