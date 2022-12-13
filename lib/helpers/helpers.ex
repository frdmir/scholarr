defmodule Scholarr.Helpers do
  @moduledoc """
  Documentation for `Helpers`.
  """
  alias Scholarr.Filesystem
  alias Scholarr.Courses
  @folder_path "/media/cursos"
  def file_scanner(path \\ @folder_path, folder \\ %{}) do
    cond do
      File.regular?(path) ->
        check_file(path, folder)

      File.dir?(path) ->
        File.ls!(path)
        |> Enum.sort()
        |> Enum.map(&Path.join(path, &1))
        |> Enum.map(&file_scanner(&1, check_folder(path, folder)))

      true ->
        nil
    end
  end

  defp check_folder(path, folder) do
    hash = :crypto.hash(:sha256, path) |> Base.encode64()
    IO.inspect(folder, label: "CHECK FOLDER")

    case Filesystem.get_folder_hash(hash) do
      nil ->
        folder_is_root?(folder, path)

      folder ->
        folder
    end
  end

  defp folder_is_root?(folder, path) do
    folder_name = Path.basename(path)

    case folder.folder_name do
      "root" ->
        uncategorized = Courses.get_category_url("uncategorized")
        result = Courses.create_course_in_category(%{display_name: folder_name}, uncategorized.id)

        {:ok, folder} =
          Filesystem.create_folder(%{
            "folder_name" => folder_name,
            "folder_path" => path,
            "folder_id" => folder.id,
            "course_id" => result.id
          })

        folder

      _ ->
        {:ok, folder} =
          Filesystem.create_folder(%{
            "folder_name" => folder_name,
            "folder_path" => path,
            "folder_id" => folder.id
          })

        folder
    end
  end

  defp check_file(path, folder) do
    hash = :crypto.hash(:sha256, path) |> Base.encode64()

    case Filesystem.get_file_hash(hash) do
      nil ->
        filename = Path.basename(path)
        {:ok, stat} = File.stat(path)

        {:ok, file} =
          Filesystem.create_file(%{
            "file_name" => filename,
            "file_path" => path,
            "file_size" => to_string(stat.size),
            "folder_id" => folder.id
          })

        file

      folder ->
        folder
    end
  end

  defp check_course(path) do
    hash = :crypto.hash(:sha256, path) |> Base.encode64()

    case Filesystem.get_file_hash(hash) do
      nil ->
        filename = Path.basename(path)
        {:ok, stat} = File.stat(path)

        {:ok, file} =
          Filesystem.create_file(%{
            "file_name" => filename,
            "file_path" => path,
            "file_size" => to_string(stat.size)
            # "folder_id" => folder.id
          })

        file

      folder ->
        folder
    end
  end
end
