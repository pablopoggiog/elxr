defmodule BlockchainWeb.TransactionsController do
  use BlockchainWeb, :controller
  alias Blockchain.BlockchainApi

  # def index(conn, _params) do
  #   # %{"blocks" => [%{"hash" => hash} | _]} = BlockchainApi.last_day_blocks
  #   %{"blocks" => blocks} = BlockchainApi.get_tx_by_hash()
  #   # render(conn, "index.html", hash: hash)
  #   render(conn, "index.html", blocks: blocks)
  # end

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
    tx = BlockchainApi.get_tx_by_hash(hash)
    # render(conn, "index.html", hash: hash)
    render(conn, "show.html", tx: tx)
  end
end
