defmodule BlockappWeb.BlockController do
  use BlockappWeb, :controller
  alias BlockappWeb.Authentication
  alias Blockapp.BitcoinApi

  def index(conn, _params) do
    current_account = conn.assigns[:current_account]
    # %{"blocks" => [%{"hash" => hash} | _]} = BlockchainApi.last_day_blocks
    %{"blocks" => blocks} = BitcoinApi.last_day_blocks()
    # render(conn, "index.html", hash: hash)
    render(conn, "index.html", blocks: blocks, current_account: current_account)
  end

  def show(conn, %{"hash" => hash}) do
    # %{"blocks" => [%{"hash" => hash} | _]} = BlockchainApi.last_day_blocks
    # %{
    # "ver": ver,
    # "next_block": next_block,
    # "time": time,
    # "bits": bits,
    # "fee": fee,
    # "nonce": nonce,
    # "n_tx": v,
    # "size": size,
    # "block_index": block_index,
    # "main_chain": main_chain,
    # "height": height,
    # "weight": weight,
    # "tx": tx
    # }
    block = BitcoinApi.get_block_by_hash(hash)
    # render(conn, "index.html", hash: hash)
    render(conn, "show.html", block: block)
  end
end
