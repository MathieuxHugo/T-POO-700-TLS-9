defmodule TodolistWeb.Router do
  use TodolistWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug Corsica, origins: "*"
  end

  scope "/api", TodolistWeb do
    pipe_through :api

    get "/users", UsersController, :index
    get "/users/:userid", UsersController, :show
    post "/users", UsersController, :create
    put "/users/:userid", UsersController, :update
    delete "/users/:userid", UsersController, :delete

    get "/workingtimes/:userid", WorkingtimesController, :index
    get "/workingtimes/:userid/:id", WorkingtimesController, :show
    post "/workingtimes/:userid", WorkingtimesController, :create
    put "/workingtimes/:id", WorkingtimesController, :update
    delete "/workingtimes/:id", WorkingtimesController, :delete

    post "/clocks/:userid", ClocksController, :create
    get "/clocks/:userid", ClocksController,:show

    #resources "/workingtimes", WorkingtimesController, except: [:create,:index, :new, :edit]
  end

end
