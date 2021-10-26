defmodule TodolistWeb.UsersController do
  use TodolistWeb, :controller

  alias Todolist.Directory
  alias Todolist.Directory.Users
  alias Todolist.Repo

  action_fallback TodolistWeb.FallbackController

  def index(conn, params) do
    case params do
      %{"username" => username, "email" => email}->render(conn, "show.json", users: Repo.get_by(Users, [username: username, email: email]))
      %{} -> render(conn, "index.json", users: Directory.list_users())
      _ -> render("show.json", [])
    end
  end

  # def index_by(conn, %{"username" => username, "email" => email}) do
  #   user = Repo.get_by(Users, [username: username, email: email])
  #   render(conn, "show.json", users: user)
  # end

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
