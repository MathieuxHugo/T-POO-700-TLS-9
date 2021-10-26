defmodule TodolistWeb.UsersController do
  use TodolistWeb, :controller

  alias Todolist.Directory
  alias Todolist.Directory.Users

  action_fallback TodolistWeb.FallbackController

  def index(conn, _params) do
    users = Directory.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"users" => users_params}) do
    with {:ok, %Users{} = users} <- Directory.create_users(users_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.users_path(conn, :show, users))
      |> render("show.json", users: users)
    end
  end

  def show(conn, %{"id" => id}) do
    users = Directory.get_users!(id)
    render(conn, "show.json", users: users)
  end

  def update(conn, %{"id" => id, "users" => users_params}) do
    users = Directory.get_users!(id)

    with {:ok, %Users{} = users} <- Directory.update_users(users, users_params) do
      render(conn, "show.json", users: users)
    end
  end

  def delete(conn, %{"id" => id}) do
    users = Directory.get_users!(id)

    with {:ok, %Users{}} <- Directory.delete_users(users) do
      send_resp(conn, :no_content, "")
    end
  end
end
