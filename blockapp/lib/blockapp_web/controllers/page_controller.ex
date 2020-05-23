defmodule BlockappWeb.PageController do
  use BlockappWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
