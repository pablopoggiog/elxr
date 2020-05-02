defmodule PhinxWeb.UserView do
  use PhinxWeb, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, PhinxWeb.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id, name: user.name, email: user.email}
  end

  def render("create.json", %{user: user}) do
    "User #{user.name} created!"
  end

  def render("delete.json", %{user: user}) do
    "User #{user.name} deleted!"
  end
end
