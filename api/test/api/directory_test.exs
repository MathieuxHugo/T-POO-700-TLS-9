defmodule Todolist.DirectoryTest do
  use Todolist.DataCase

  alias Todolist.Directory

  describe "users" do
    alias Todolist.Directory.Users

    import Todolist.DirectoryFixtures

    @invalid_attrs %{email: nil, username: nil}

    test "list_users/0 returns all users" do
      users = users_fixture()
      assert Directory.list_users() == [users]
    end

    test "get_user!/1 returns the users with given id" do
      users = users_fixture()
      assert Directory.get_user!(users.id) == users
    end

    test "create_user/1 with valid data creates a users" do
      valid_attrs = %{email: "some email", username: "some username"}

      assert {:ok, %Users{} = users} = Directory.create_user(valid_attrs)
      assert users.email == "some email"
      assert users.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Directory.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the users" do
      users = users_fixture()
      update_attrs = %{email: "some updated email", username: "some updated username"}

      assert {:ok, %Users{} = users} = Directory.update_user(users, update_attrs)
      assert users.email == "some updated email"
      assert users.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      users = users_fixture()
      assert {:error, %Ecto.Changeset{}} = Directory.update_user(users, @invalid_attrs)
      assert users == Directory.get_user!(users.id)
    end

    test "delete_user/1 deletes the users" do
      users = users_fixture()
      assert {:ok, %Users{}} = Directory.delete_user(users)
      assert_raise Ecto.NoResultsError, fn -> Directory.get_user!(users.id) end
    end

    test "change_user/1 returns a users changeset" do
      users = users_fixture()
      assert %Ecto.Changeset{} = Directory.change_user(users)
    end
  end

  describe "clocks" do
    alias Todolist.Directory.Clocks

    import Todolist.DirectoryFixtures

    @invalid_attrs %{status: nil, time: nil}

    test "list_clocks/0 returns all clocks" do
      clocks = clocks_fixture()
      assert Directory.list_clocks() == [clocks]
    end

    test "get_clocks!/1 returns the clocks with given id" do
      clocks = clocks_fixture()
      assert Directory.get_clocks!(clocks.id) == clocks
    end

    test "create_clocks/1 with valid data creates a clocks" do
      valid_attrs = %{status: true, time: ~T[14:00:00]}

      assert {:ok, %Clocks{} = clocks} = Directory.create_clocks(valid_attrs)
      assert clocks.status == true
      assert clocks.time == ~T[14:00:00]
    end

    test "create_clocks/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Directory.create_clocks(@invalid_attrs)
    end

    test "update_clocks/2 with valid data updates the clocks" do
      clocks = clocks_fixture()
      update_attrs = %{status: false, time: ~T[15:01:01]}

      assert {:ok, %Clocks{} = clocks} = Directory.update_clocks(clocks, update_attrs)
      assert clocks.status == false
      assert clocks.time == ~T[15:01:01]
    end

    test "update_clocks/2 with invalid data returns error changeset" do
      clocks = clocks_fixture()
      assert {:error, %Ecto.Changeset{}} = Directory.update_clocks(clocks, @invalid_attrs)
      assert clocks == Directory.get_clocks!(clocks.id)
    end

    test "delete_clocks/1 deletes the clocks" do
      clocks = clocks_fixture()
      assert {:ok, %Clocks{}} = Directory.delete_clocks(clocks)
      assert_raise Ecto.NoResultsError, fn -> Directory.get_clocks!(clocks.id) end
    end

    test "change_clocks/1 returns a clocks changeset" do
      clocks = clocks_fixture()
      assert %Ecto.Changeset{} = Directory.change_clocks(clocks)
    end
  end

  describe "workingtimes" do
    alias Todolist.Directory.Workingtimes

    import Todolist.DirectoryFixtures

    @invalid_attrs %{end: nil, start: nil}

    test "list_workingtimes/0 returns all workingtimes" do
      workingtimes = workingtimes_fixture()
      assert Directory.list_workingtimes() == [workingtimes]
    end

    test "get_workingtimes!/1 returns the workingtimes with given id" do
      workingtimes = workingtimes_fixture()
      assert Directory.get_workingtimes!(workingtimes.id) == workingtimes
    end

    test "create_workingtimes/1 with valid data creates a workingtimes" do
      valid_attrs = %{end: ~N[2021-10-25 07:51:00], start: ~N[2021-10-25 07:51:00]}

      assert {:ok, %Workingtimes{} = workingtimes} = Directory.create_workingtimes(valid_attrs)
      assert workingtimes.end == ~N[2021-10-25 07:51:00]
      assert workingtimes.start == ~N[2021-10-25 07:51:00]
    end

    test "create_workingtimes/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Directory.create_workingtimes(@invalid_attrs)
    end

    test "update_workingtimes/2 with valid data updates the workingtimes" do
      workingtimes = workingtimes_fixture()
      update_attrs = %{end: ~N[2021-10-26 07:51:00], start: ~N[2021-10-26 07:51:00]}

      assert {:ok, %Workingtimes{} = workingtimes} = Directory.update_workingtimes(workingtimes, update_attrs)
      assert workingtimes.end == ~N[2021-10-26 07:51:00]
      assert workingtimes.start == ~N[2021-10-26 07:51:00]
    end

    test "update_workingtimes/2 with invalid data returns error changeset" do
      workingtimes = workingtimes_fixture()
      assert {:error, %Ecto.Changeset{}} = Directory.update_workingtimes(workingtimes, @invalid_attrs)
      assert workingtimes == Directory.get_workingtimes!(workingtimes.id)
    end

    test "delete_workingtimes/1 deletes the workingtimes" do
      workingtimes = workingtimes_fixture()
      assert {:ok, %Workingtimes{}} = Directory.delete_workingtimes(workingtimes)
      assert_raise Ecto.NoResultsError, fn -> Directory.get_workingtimes!(workingtimes.id) end
    end

    test "change_workingtimes/1 returns a workingtimes changeset" do
      workingtimes = workingtimes_fixture()
      assert %Ecto.Changeset{} = Directory.change_workingtimes(workingtimes)
    end
  end
end
