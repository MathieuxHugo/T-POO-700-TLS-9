defmodule TodolistWeb.UsersController do
  import Ecto.Query, only: [from: 2]
  use TodolistWeb, :controller

  alias Todolist.Directory
  alias Todolist.Directory.Users
  alias Todolist.Repo

  require Logger

  action_fallback TodolistWeb.FallbackController

  def index(conn, %{"username" => username, "email" => email}) do
    query = from u in Users,
        where: u.username == ^username
        and u.email == ^email
    users = Repo.all(query)
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"users" => users_params}) do Logger.info(users_params["email"])
    if Regex.match?(~r/^[a-z0-9]+[a-z0-9'.']*[@][a-z0-9]+['.'][a-z]+$/, users_params["email"]) do
      with {:ok, %Users{} = users} <- Directory.create_users(users_params) do
        conn
        |> put_status(:created)
        |> put_resp_header("location", Routes.users_path(conn, :show, users))
        |> render("show.json", users: users)
      end
    else
      Logger.warning("wrong email format")
    end
  end

  def show(conn, %{"userid" => id}) do
    users = Directory.get_users!(id)
    render(conn, "show.json", users: users)
  end

  def update(conn, %{"userid" => id, "users" => users_params}) do
    users = Directory.get_users!(id)

    with {:ok, %Users{} = users} <- Directory.update_users(users, users_params) do
      render(conn, "show.json", users: users)
    end
  end

  def delete(conn, %{"userid" => id}) do
    users = Directory.get_users!(id)

    with {:ok, %Users{}} <- Directory.delete_users(users) do
      send_resp(conn, :no_content, "")
    end
  end
end
