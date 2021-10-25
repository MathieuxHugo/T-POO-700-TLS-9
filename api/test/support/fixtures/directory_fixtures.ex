defmodule Todolist.DirectoryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Todolist.Directory` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        username: "some username"
      })
      |> Todolist.Directory.create_user()

    user
  end
end
