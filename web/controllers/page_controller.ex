defmodule Pdelivery.PageController do
  use Pdelivery.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
