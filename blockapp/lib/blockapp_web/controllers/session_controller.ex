defmodule BlockappWeb.SessionController do
  use BlockappWeb, :controller

  def new(conn, _params) do
    render(conn, :new, changeset: conn, action: "/login")
  end
end
