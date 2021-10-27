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
    get "/workingtimes/:userid/:id", WorkingtimesController, :get_one
    post "/workingtimes/:id", WorkingtimesController, :create
    resources "/workingtimes", WorkingtimesController, except: [:create,:index, :new, :edit]
  end

end
