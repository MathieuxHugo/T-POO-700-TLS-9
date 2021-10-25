defmodule TodolistWeb.DefaultController do
  use TodolistWeb, :controller

  def index(conn, _params) do
    text conn, "TodolistWeb!"
  end
end
