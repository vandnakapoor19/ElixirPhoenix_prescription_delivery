defmodule Pdelivery.Router do
  use Pdelivery.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Pdelivery do
    pipe_through :browser # Use the default browser stack

    # get "/", OrderController, :index
    # get "/orders/new", OrderController, :new
    # post "/orders", OrderController, :create
    # get "/orders/:id/edit", OrderController, :edit
    # put "/orders/:id", OrderController, :update

    resources "/", OrderController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Pdelivery do
  #   pipe_through :api
  # end
end
