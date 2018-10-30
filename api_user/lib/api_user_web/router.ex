defmodule ApiUserWeb.Router do
  use ApiUserWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", ApiUserWeb do
    pipe_through :api
    resources "/users", UserController, only: [:index, :show, :create]
  end
end
