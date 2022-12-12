defmodule Scholarr.Sources.Folder do
  use Scholarr.Schema
  import Ecto.Changeset

  @primary_key {:id, :string, autogenerate: {Ecto.Nanoid, :gen, [:string]}}
  schema "folder" do
    field :folder_name, :string
    field :folder_path, :string
    field :folder_path_hash, :string
    field :status, :boolean

    belongs_to :parent, Scholarr.Sources.Folder
    has_many :files, Scholarr.Sources.File
    timestamps()
  end

  @param_fields [:folder_name, :folder_path, :folder_path_hash, :status, :parent_id]
  @required_fields [:folder_name, :folder_path, :parent_id]
  @optional_fields []
  @doc false
  def changeset(folder, attrs) do
    folder
    |> cast(attrs, @param_fields, @optional_fields)
    |> validate_required(@required_fields)
    |> Scholarr.Sources.File.path_hash(:folder_path, :folder_path_hash)
    |> Scholarr.Sources.File.file_status(:folder_path)
  end
end
