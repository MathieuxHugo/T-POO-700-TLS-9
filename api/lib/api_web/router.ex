defmodule TodolistWeb.Router do
  use TodolistWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug Corsica, origins: "*"
  end

  scope "/api", TodolistWeb do
    pipe_through :api

<<<<<<< Updated upstream
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
    #resources "/users", UsersController, except: [:new, :edit]
    #resources "/clocks", ClocksController, except: [:new, :edit]

=======
    post "/clocks/:id", ClocksController, :create
    get "/clocks/:id", ClocksController,:show
    resources "/users", UsersController, except: [:new, :edit]
    get "/workingtimes/:userid/:id", WorkingtimesController, :get_one
    post "/workingtimes/:id", WorkingtimesController, :create
>>>>>>> Stashed changes
    resources "/workingtimes", WorkingtimesController, except: [:create,:index, :new, :edit]
  end

end
