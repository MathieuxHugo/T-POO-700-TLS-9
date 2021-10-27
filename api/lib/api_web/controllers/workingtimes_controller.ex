defmodule TodolistWeb.WorkingtimesController do
  import Ecto.Query, only: [from: 2]
  use TodolistWeb, :controller

  alias Todolist.Directory
  alias Todolist.Directory.Workingtimes
  alias Todolist.Repo

  action_fallback TodolistWeb.FallbackController

  def index(conn, %{"userid" => id, "start" => start, "end" => stop}) do
    query = from u in Workingtimes,
            where: u.users == ^id
            and u.start >= ^start
            and u.end <= ^stop
    workingtimes = Repo.all(query)
    render(conn, "index.json", workingtimes: workingtimes)
  end

  def create(conn, %{"userid" => id,"workingtimes" => workingtimes_params}) do
    with {:ok, %Workingtimes{} = workingtimes} <- Directory.create_workingtimes(Map.put(workingtimes_params, "users", id)) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.workingtimes_path(conn, :show, workingtimes))
      |> render("show.json", workingtimes: workingtimes)
    end
  end

  def show(conn, %{"userid" => userid, "id" => id}) do
    query = from u in Workingtimes,
            where: u.id == ^id
            and u.users == ^userid
    workingtimes = Repo.all(query)
    render(conn, "index.json", workingtimes: workingtimes)
  end

  def update(conn, %{"id" => id, "workingtimes" => workingtimes_params}) do
    workingtimes = Directory.get_workingtimes!(id)

    with {:ok, %Workingtimes{} = workingtimes} <- Directory.update_workingtimes(workingtimes, workingtimes_params) do
      render(conn, "show.json", workingtimes: workingtimes)
    end
  end

  def delete(conn, %{"id" => id}) do
    workingtimes = Directory.get_workingtimes!(id)

    with {:ok, %Workingtimes{}} <- Directory.delete_workingtimes(workingtimes) do
      send_resp(conn, :no_content, "")
    end
  end
end
