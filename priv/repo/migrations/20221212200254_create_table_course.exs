defmodule Scholarr.Repo.Migrations.CreateTableCourse do
  use Ecto.Migration

  def change do
    create table(:course, primary_key: false) do
      add :id, :string, primary_key: true
      add :display_name, :string
      add :videos, :string
      add :thumbnail_link, :string
      add :thumbnail_version, :string
      add :total_folders, :integer, default: 0
      add :total_files, :integer, default: 0
      add :total_bytes, :integer, default: 0

      # add :category_id, references(:category, type: :string, on_delete: :delete_all)
      # add :subcategory_id, references(:subcategory, type: :string, on_delete: :delete_all)
      # add :folder_id, references(:folder, type: :string, on_delete: :delete_all)
      timestamps()
    end
  end
end
