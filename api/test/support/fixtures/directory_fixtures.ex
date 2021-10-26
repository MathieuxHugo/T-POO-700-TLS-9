defmodule Todolist.DirectoryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Todolist.Directory` context.
  """

  @doc """
  Generate a users.
  """
  def users_fixture(attrs \\ %{}) do
    {:ok, users} =
      attrs
      |> Enum.into(%{
        email: "some email",
        username: "some username"
      })
      |> Todolist.Directory.create_user()

    users
  end

  @doc """
  Generate a clocks.
  """
  def clocks_fixture(attrs \\ %{}) do
    {:ok, clocks} =
      attrs
      |> Enum.into(%{
        status: true,
        time: ~T[14:00:00]
      })
      |> Todolist.Directory.create_clocks()

    clocks
  end

  @doc """
  Generate a workingtimes.
  """
  def workingtimes_fixture(attrs \\ %{}) do
    {:ok, workingtimes} =
      attrs
      |> Enum.into(%{
        end: ~N[2021-10-25 07:51:00],
        start: ~N[2021-10-25 07:51:00]
      })
      |> Todolist.Directory.create_workingtimes()

    workingtimes
  end
end
