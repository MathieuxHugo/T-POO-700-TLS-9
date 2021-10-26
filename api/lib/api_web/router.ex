defmodule TodolistWeb.Router do
  use TodolistWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TodolistWeb do
    pipe_through :api

    post "/clocks/:id", ClocksController, :create
    get "/clocks/:id", ClocksController,:show
    resources "/users", UsersController, except: [:new, :edit]
    #resources "/clocks", ClocksController, except: [:new, :edit]
    resources "/workingtimes", WorkingtimesController, except: [:new, :edit]
  end

  scope "/", TodolistWeb do
    pipe_through :api
    get "/", DefaultController, :index
  end

end
