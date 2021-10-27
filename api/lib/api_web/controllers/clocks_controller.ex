defmodule TodolistWeb.ClocksController do
  import Ecto.Query, only: [from: 2]
  use TodolistWeb, :controller

  alias Todolist.Directory
  alias Todolist.Directory.Clocks
  alias Todolist.Repo

  require Logger

  action_fallback TodolistWeb.FallbackController

  # def index(conn, _params) do
  #   clocks = Directory.list_clocks()
  #   render(conn, "index.json", clocks: clocks)
  # end

  def create(conn, %{"userid" => id, "clocks" => clocks_params}) do
    with {:ok, %Clocks{} = clocks} <- Directory.create_clocks(Map.put( clocks_params, "users",id)) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.clocks_path(conn, :show, clocks))
      |> render("show.json", clocks: clocks)
    end
  end

  def show(conn, %{"userid" => id}) do
    query = from u in Clocks, where: u.users == ^id
    clocks = Repo.all(query)
    render(conn, "index.json", clocks: clocks)
  end

  # def update(conn, %{"id" => id, "clocks" => clocks_params}) do
  #   clocks = Directory.get_clocks!(id)

  #   with {:ok, %Clocks{} = clocks} <- Directory.update_clocks(clocks, clocks_params) do
  #     render(conn, "show.json", clocks: clocks)
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   clocks = Directory.get_clocks!(id)

  #   with {:ok, %Clocks{}} <- Directory.delete_clocks(clocks) do
  #     send_resp(conn, :no_content, "")
  #   end
  # end
end
