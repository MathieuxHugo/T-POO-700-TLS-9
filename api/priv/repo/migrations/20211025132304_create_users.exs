defmodule Todolist.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :email, :string
      add :role, :string
      add :teams, {:array, :string}
      timestamps()
    end
  end
end
