defmodule Scholarr.Repo.Migrations.CreateTableCourse do
  use Ecto.Migration

  def change do
    create table(:course, primary_key: false) do
      add :id, :string, primary_key: true
      add :description, :string
      add :display_name, :string, null: false
      add :files, :integer
      add :folders, :integer
      add :hours, :integer
      add :size, :integer
      add :thumbnail, :boolean
      add :thumbnail_path, :string
      add :thumbnail_version, :string
      add :topic, :string
      add :videos, :string
      add :videos_played, :string
      add :url, :string

      # add :category_id, references(:category, type: :string, on_delete: :delete_all)
      # add :subcategory_id, references(:subcategory, type: :string, on_delete: :delete_all)
      # add :folder_id, references(:folder, type: :string, on_delete: :delete_all)
      timestamps()
    end
  end
end
