defmodule TodolistWeb.UserView do
  use TodolistWeb, :view
  alias TodolistWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "users.json")}
  end

  def render("show.json", %{users: users}) do
    %{data: render_one(users, UserView, "users.json")}
  end

  def render("users.json", %{users: users}) do
    %{
      id: users.id,
      username: users.username,
      email: users.email
    }
  end
end
