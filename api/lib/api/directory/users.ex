defmodule Todolist.Directory.Users do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :username, :string
    field :role, :string
    field :teams, {:array, :string}
    timestamps()
  end

  @doc false
  def changeset(users, attrs) do
    users
    |> cast(attrs, [:username, :email, :role, :teams])
    |> validate_required([:username, :email, :role, :teams])
  end
end
