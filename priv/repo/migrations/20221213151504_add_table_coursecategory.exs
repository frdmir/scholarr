defmodule Scholarr.Repo.Migrations.AddTableCourseCategory do
  use Ecto.Migration

  def change do
    create table(:course_category, primary_key: false) do
      add :course_id, references(:course, type: :string), primary_key: true
      add :category_id, references(:category, type: :string), primary_key: true
    end

    create index(:course_category, [:course_id])
    create index(:course_category, [:category_id])

    create unique_index(:course_category, [:course_id, :category_id],
             name: :course_id_category_id_unique_index
           )
  end
end
