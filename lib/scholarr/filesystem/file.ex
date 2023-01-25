defmodule Scholarr.Filesystem.File do
  use Scholarr.Schema
  import Ecto.Changeset

  @primary_key {:id, :string, autogenerate: {Ecto.Nanoid, :gen, [:string]}}
  schema "file" do
    field :content_hash, :string
    field :file_extension, :string
    field :file_name, :string
    field :file_path, :string
    field :file_path_hash, :string
    field :file_size, :string
    field :mime_type, :string
    field :status, :boolean

    belongs_to :parent, Scholarr.Filesystem.Folder, foreign_key: :parent_id

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
  end

  def create_file(file, attrs \\ %{}) do
    changeset(file, attrs)
    |> content_hash()
    |> path_hash([:file_path, :file_name, :file_extension], :file_path_hash)
    |> unique_constraint(:content_hash)
    |> set_mimetype()
    |> file_status(:file_path)
  end

  defp content_hash(changeset) do
    IO.inspect(changeset)
    IO.inspect(changeset.data)

    put_change(
      changeset,
      :content_hash,
      :crypto.hash_init(:sha256)
      |> :crypto.hash_update(get_field(changeset, :file_name))
      |> :crypto.hash_update(to_string(get_field(changeset, :file_size)))
      |> :crypto.hash_final()
      |> Base.encode64()
    )
  end

  def path_hash(changeset, [path, file, ext], destination) do
    IO.inspect(changeset)
    IO.inspect(changeset.data)

    put_change(
      changeset,
      destination,
      :crypto.hash(
        :sha256,
        Path.join(get_field(changeset, path), [
          get_field(changeset, file),
          get_field(changeset, ext)
        ])
      )
      |> Base.encode64()
    )
  end

  def path_hash(changeset, field, destination),
    do:
      put_change(
        changeset,
        destination,
        :crypto.hash(:sha256, get_field(changeset, field))
        |> Base.encode64()
      )

  defp set_mimetype(changeset),
    do: put_change(changeset, :mime_type, MIME.from_path(get_field(changeset, :file_name)))

  def file_status(changeset, destination),
    do: put_change(changeset, :status, File.exists?(get_field(changeset, destination)))
end
