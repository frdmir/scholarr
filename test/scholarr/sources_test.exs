defmodule Scholarr.SourcesTest do
  use Scholarr.DataCase

  alias Scholarr.Filesystem

  describe "file" do
    alias Scholarr.Filesystem.File

    import Scholarr.SourceFixtures

    @invalid_attrs %{file_name: nil}

    test "list_file/0 returns all file" do
      file = file_fixture()
      assert Filesystem.list_file() == [file]
    end

    test "get_file!/1 returns the file with given id" do
      file = file_fixture()
      assert Filesystem.get_file!(file.id) == file
    end

    test "create_file/1 with valid data creates a file" do
      valid_attrs = %{file_name: "some file_name"}

      assert {:ok, %File{} = file} = Filesystem.create_file(valid_attrs)
      assert file.file_name == "some file_name"
    end

    test "create_file/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Filesystem.create_file(@invalid_attrs)
    end

    test "update_file/2 with valid data updates the file" do
      file = file_fixture()
      update_attrs = %{file_name: "some updated file_name"}

      assert {:ok, %File{} = file} = Filesystem.update_file(file, update_attrs)
      assert file.file_name == "some updated file_name"
    end

    test "update_file/2 with invalid data returns error changeset" do
      file = file_fixture()
      assert {:error, %Ecto.Changeset{}} = Filesystem.update_file(file, @invalid_attrs)
      assert file == Filesystem.get_file!(file.id)
    end

    test "delete_file/1 deletes the file" do
      file = file_fixture()
      assert {:ok, %File{}} = Filesystem.delete_file(file)
      assert_raise Ecto.NoResultsError, fn -> Filesystem.get_file!(file.id) end
    end

    test "change_file/1 returns a file changeset" do
      file = file_fixture()
      assert %Ecto.Changeset{} = Filesystem.change_file(file)
    end
  end

  describe "folder" do
    alias Scholarr.Filesystem.Folder

    import Scholarr.SourcesFixtures

    @invalid_attrs %{folder_name: nil}

    test "list_folder/0 returns all folder" do
      folder = folder_fixture()
      assert Filesystem.list_folder() == [folder]
    end

    test "get_folder!/1 returns the folder with given id" do
      folder = folder_fixture()
      assert Filesystem.get_folder!(folder.id) == folder
    end

    test "create_folder/1 with valid data creates a folder" do
      valid_attrs = %{folder_name: "some folder_name"}

      assert {:ok, %Folder{} = folder} = Filesystem.create_folder(valid_attrs)
      assert folder.folder_name == "some folder_name"
    end

    test "create_folder/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Filesystem.create_folder(@invalid_attrs)
    end

    test "update_folder/2 with valid data updates the folder" do
      folder = folder_fixture()
      update_attrs = %{folder_name: "some updated folder_name"}

      assert {:ok, %Folder{} = folder} = Filesystem.update_folder(folder, update_attrs)
      assert folder.folder_name == "some updated folder_name"
    end

    test "update_folder/2 with invalid data returns error changeset" do
      folder = folder_fixture()
      assert {:error, %Ecto.Changeset{}} = Filesystem.update_folder(folder, @invalid_attrs)
      assert folder == Filesystem.get_folder!(folder.id)
    end

    test "delete_folder/1 deletes the folder" do
      folder = folder_fixture()
      assert {:ok, %Folder{}} = Filesystem.delete_folder(folder)
      assert_raise Ecto.NoResultsError, fn -> Filesystem.get_folder!(folder.id) end
    end

    test "change_folder/1 returns a folder changeset" do
      folder = folder_fixture()
      assert %Ecto.Changeset{} = Filesystem.change_folder(folder)
    end
  end
end
