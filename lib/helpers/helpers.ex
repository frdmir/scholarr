defmodule Scholarr.Helpers do
  @moduledoc """
  Documentation for `Helpers`.
  """
  alias Scholarr.Sources
  @parent_path "/media/cursos"
  def file_scanner(path \\ @parent_path, parent \\ %{id: "root"}) do
    cond do
      File.regular?(path) ->
        check_file(path, parent)

      File.dir?(path) ->
        File.ls!(path)
        |> Enum.sort()
        |> Enum.map(&Path.join(path, &1))
        |> Enum.map(&file_scanner(&1, check_folder(path, parent)))

      true ->
        nil
    end
  end

  defp check_folder(path, parent) do
    hash = :crypto.hash(:sha256, path) |> Base.encode64()

    case Sources.get_folder_hash(hash) do
      nil ->
        folder_name = Path.basename(path)

        {:ok, folder} =
          Sources.create_folder(%{
            "folder_name" => folder_name,
            "folder_path" => path,
            "parent_id" => parent.id
          })

        folder

      parent ->
        parent
    end
  end

  defp check_file(path, parent) do
    hash = :crypto.hash(:sha256, path) |> Base.encode64()

    case Sources.get_file_hash(hash) do
      nil ->
        filename = Path.basename(path)
        {:ok, stat} = File.stat(path)

        {:ok, file} =
          Sources.create_file(%{
            "file_name" => filename,
            "file_path" => path,
            "file_size" => to_string(stat.size),
            "parent_id" => parent.id
          })

        file

      parent ->
        parent
    end
  end

  defp check_course() do
    hash = :crypto.hash(:sha256, path) |> Base.encode64()

    case Sources.get_file_hash(hash) do
      nil ->
        filename = Path.basename(path)
        {:ok, stat} = File.stat(path)

        {:ok, file} =
          Sources.create_file(%{
            "file_name" => filename,
            "file_path" => path,
            "file_size" => to_string(stat.size),
            "parent_id" => parent.id
          })

        file

      parent ->
        parent
    end
  end
end
