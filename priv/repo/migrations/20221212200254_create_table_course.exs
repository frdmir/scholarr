defmodule Scholarr.Repo.Migrations.CreateTableCourse do
  use Ecto.Migration

  def change do
    create table(:course, primary_key: false) do
      add :id, :string, primary_key: true
      add :display_name, :string
      add :videos, :string
      add :thumbnail_link, :string
      add :thumbnail_version, :string

      add :category_id, references(:category, type: :string, on_delete: :delete_all)
      add :subcategory_id, references(:subcategory, type: :string, on_delete: :delete_all)
      add :folder_id, references(:folder, type: :string, on_delete: :delete_all)
      timestamps()
    end
  end
end
