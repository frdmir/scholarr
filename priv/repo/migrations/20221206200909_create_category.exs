defmodule Scholarr.Repo.Migrations.CreateCategory do
  use Ecto.Migration

  def change do
    create table(:category, primary_key: false) do
      add :id, :string, primary_key: true
      add :title, :string
      add :url, :string
      timestamps()
    end

    create unique_index(:category, [:title])
  end
end
