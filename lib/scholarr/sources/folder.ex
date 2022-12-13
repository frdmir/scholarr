defmodule Scholarr.Filesystem.Folder do
  use Scholarr.Schema
  import Ecto.Changeset

  @primary_key {:id, :string, autogenerate: {Ecto.Nanoid, :gen, [:string]}}
  schema "folder" do
    field :folder_name, :string
    field :folder_path, :string
    field :folder_path_hash, :string
    field :status, :boolean

    belongs_to :folder, Scholarr.Filesystem.Folder
    belongs_to :course, Scholarr.Courses.Course
    has_many :file, Scholarr.Filesystem.File
    timestamps()
  end

  @param_fields [:folder_name, :folder_path, :folder_path_hash, :status, :folder_id, :course_id]
  @required_fields [:folder_name, :folder_path, :folder_id]
  @optional_fields []
  @root_fields [:folder_name, :folder_path, :folder_path_hash, :status]
  @doc false
  def changeset(folder, attrs) do
    folder
    |> cast(attrs, @param_fields, @optional_fields)
    |> validate_required(@required_fields)
    |> Scholarr.Filesystem.File.path_hash(:folder_path, :folder_path_hash)
    |> unique_constraint(:folder_path_hash)
    |> Scholarr.Filesystem.File.file_status(:folder_path)
  end

  def root_changeset(folder, attrs) do
    folder
    |> cast(attrs, @root_fields)
    |> validate_required([:folder_name, :folder_path])
    |> Scholarr.Filesystem.File.path_hash(:folder_path, :folder_path_hash)
    |> Scholarr.Filesystem.File.file_status(:folder_path)
  end
end

# %{"folder_name" => "root", "folder_path" => "/media/cursos", "folder_id" => "root"}
