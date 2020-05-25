defmodule BlockappWeb.PageController do
  use BlockappWeb, :controller
  alias BlockappWeb.Authentication

  def index(conn, _params) do
    current_account = Authentication.get_current_account(conn)
    render(conn, "index.html", current_account: current_account)
  end
end
