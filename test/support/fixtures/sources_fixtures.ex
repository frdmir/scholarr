defmodule Scholarr.SourcesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Scholarr.Sources` context.
  """

  @doc """
  Generate a file.
  """
  def file_fixture(attrs \\ %{}) do
    {:ok, file} =
      attrs
      |> Enum.into(%{
        file_name: "some file_name"
      })
      |> Scholarr.Sources.create_file()

    file
  end

  @doc """
  Generate a folder.
  """
  def folder_fixture(attrs \\ %{}) do
    {:ok, folder} =
      attrs
      |> Enum.into(%{
        folder_name: "some folder_name"
      })
      |> Scholarr.Sources.create_folder()

    folder
  end
end
