defmodule Scholarr.Schema do
  @moduledoc "Ecto Schema Helpers"

  defmacro __using__(_) do
    quote do
      use Ecto.Schema
      import Ecto.Changeset

      @primary_key {:id, :string, autogenerate: {Ecto.Nanoid, :gen, [:string]}}
      @foreign_key_type :string
    end
  end
end
