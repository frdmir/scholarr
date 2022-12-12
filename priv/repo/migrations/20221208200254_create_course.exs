defmodule Scholarr.Repo.Migrations.CreateCourse do
  use Ecto.Migration

  def change do
    create table(:course, primary_key: false) do
      add :id, :string, primary_key: true
      add :display_name, :string
      add :videos, :string
      add :thumbnail_link, :string
      add :thumbnail_version, :string
      timestamps()
    end
  end
end
