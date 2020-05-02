defmodule PhinxWeb.HackView do
  use PhinxWeb, :view

  def render("hack.json", %{user: %{password: password}}) do
    %{decrypted_password: password}
  end
end
