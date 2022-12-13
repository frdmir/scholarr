defmodule Scholarr.Repo.Migrations.AddTableCourseSubcategory do
  use Ecto.Migration

  def change do
    create table(:course_subcategory, primary_key: false) do
      add :course_id, references(:course, type: :string), primary_key: true
      add :subcategory_id, references(:subcategory, type: :string), primary_key: true
    end

    create index(:course_subcategory, [:course_id])
    create index(:course_subcategory, [:subcategory_id])

    create unique_index(:course_subcategory, [:course_id, :subcategory_id],
             name: :course_id_subcategory_id_unique_index
           )
  end
end
