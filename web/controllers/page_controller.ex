defmodule PhoenixBoilerplate.PageController do
  use PhoenixBoilerplate.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
