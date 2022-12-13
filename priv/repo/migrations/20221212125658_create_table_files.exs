defmodule Scholarr.Repo.Migrations.CreateTableFile do
  use Ecto.Migration

  def change do
    create table(:file, primary_key: false) do
      add :id, :string, primary_key: true
      add :content_hash, :string
      add :file_extension, {:array, :string}
      add :file_name, :string
      add :file_path, :string
      add :file_path_hash, :string
      add :file_size, :string
      add :mime_type, :string
      add :status, :boolean

      add :parent_id, references(:folder, type: :string, on_delete: :delete_all)
      timestamps()
    end

    create unique_index(:file, [:id, :content_hash])
  end
end
