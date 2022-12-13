defmodule Scholarr.Repo.Migrations.AlterTableFoldersCourse do
  use Ecto.Migration

  def change do
    alter table(:folder) do
      add :course_id, references(:course, type: :string, on_delete: :delete_all)
    end
  end
end
