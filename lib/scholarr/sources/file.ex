defmodule Scholarr.Sources.File do
  use Scholarr.Schema
  import Ecto.Changeset

  @primary_key {:id, :string, autogenerate: {Ecto.Nanoid, :gen, [:string]}}
  schema "file" do
    field :content_hash, :string
    field :file_extension, {:array, :string}
    field :file_name, :string
    field :file_path, :string
    field :file_path_hash, :string
    field :file_size, :string
    field :mime_type, :string
    field :status, :boolean

    belongs_to :parent, Scholarr.Sources.Folder
    timestamps()
  end

  @param_fields [
    :file_name,
    :file_path,
    :file_path_hash,
    :file_size,
    :mime_type,
    :status,
    :content_hash,
    :file_extension,
    :parent_id
  ]
  @required_fields [:file_name, :file_path, :file_size, :parent_id]
  @optional_fields []
  @doc false
  def changeset(file, attrs \\ %{}) do
    file
    |> cast(attrs, @param_fields, @optional_fields)
    |> validate_required(@required_fields)
    |> content_hash()
    |> path_hash(:file_path, :file_path_hash)
    |> set_mimetype()
    |> file_status(:file_path)
  end

  defp content_hash(changeset) do
    hash =
      :crypto.hash_init(:sha256)
      |> :crypto.hash_update(get_change(changeset, :file_name))
      |> :crypto.hash_update(to_string(get_change(changeset, :file_size)))
      |> :crypto.hash_final()
      |> Base.encode64()

    put_change(changeset, :content_hash, hash)
  end

  def path_hash(changeset, field, destination) do
    hash =
      :crypto.hash(:sha256, get_change(changeset, field))
      |> Base.encode64()

    put_change(changeset, destination, hash)
  end

  defp set_mimetype(changeset) do
    mime_type =
      MIME.from_path(get_change(changeset, :file_name))
      |> IO.inspect()

    extension = MIME.extensions(mime_type)

    put_change(changeset, :mime_type, mime_type)
    |> put_change(:file_extension, extension)
  end

  def file_status(changeset, destination),
    do: put_change(changeset, :status, File.exists?(get_change(changeset, destination)))
end
