defmodule Todolist.Directory.Clocks do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clocks" do
    field :status, :boolean, default: false
    field :time, :naive_datetime
    field :users, :id

    timestamps()
  end

  @doc false
  def changeset(clocks, attrs) do
    clocks
    |> cast(attrs, [:time, :status,:users])
    |> validate_required([:time, :status,:users])
  end
end
