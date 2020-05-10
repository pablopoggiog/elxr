defmodule BlockchainWeb.PageController do
  use BlockchainWeb, :controller
  alias Blockchain.BlockchainApi

  def index(conn, _params) do
    %{"blocks" => [%{"hash" => hash} | _]} = BlockchainApi.last_day_blocks()
    render(conn, "index.html", blocks: hash)
  end
end
