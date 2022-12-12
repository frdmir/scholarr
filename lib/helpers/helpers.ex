defmodule Scholarr.Helpers do
  @moduledoc """
  Documentation for `Helpers`.
  """
  alias Scholarr.Sources
  @parent_path "/media/cursos"
  def file_scanner(path \\ @parent_path, parent \\ %{id: "root"}) do
    cond do
      File.regular?(path) ->
        filename = Path.basename(path)
        {:ok, stat} = File.stat(path)
        mime_type = MIME.from_path(filename)

      # %{
      #   "parent_path" => parent,
      #   "parent_name" => Path.basename(parent),
      #   "parent_path_hash" => :crypto.hash(:sha, parent) |> Base.encode64(),
      #   "file_name" => filename,
      #   "file_path" => path,
      #   "file_size" => to_string(stat.size),
      #   "file_extension" => MIME.extensions(mime_type),
      #   "mime_type" => mime_type,
      #   "content_hash" =>
      #     :crypto.hash_init(:sha256)
      #     |> :crypto.hash_update(filename)
      #     |> :crypto.hash_update(to_string(stat.size))
      #     |> :crypto.hash_final()
      #     |> Base.encode64(),
      #   "file_path_hash" => :crypto.hash(:sha256, path) |> Base.encode64(),
      #   "status" => File.exists?(path)
      # }

      File.dir?(path) ->
        basename = Path.basename(path)

        {:ok, parent} =
          Sources.create_folder(%{
            "folder_name" => basename,
            "folder_path" => path,
            "parent_id" => parent.id
          })

        File.ls!(path)
        |> Enum.sort()
        |> Enum.map(&Path.join(path, &1))
        |> Enum.map(&file_scanner(&1, parent))

      true ->
        []
    end
  end
end
