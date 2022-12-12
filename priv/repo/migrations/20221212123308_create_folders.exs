defmodule Scholarr.Repo.Migrations.CreateFolder do
  use Ecto.Migration

  def change do
    create table(:folder, primary_key: false) do
      add :id, :string, primary_key: true
      add :folder_name, :string
      add :folder_path, :string
      add :folder_path_hash, :string
      add :status, :boolean

      add :parent_id, references(:folder, type: :string)
      timestamps()
    end

    create unique_index(:folder, [:id, :folder_path_hash])
  end
end
