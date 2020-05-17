defmodule Blockchain.BlockchainApi do
  import HTTPoison
  @url "https://blockchain.info/latestblock"
  @tx_url "https://blockchain.info/rawtx/"

  def latest_block do
    case HTTPoison.get(@url) do
      {:ok, %{status_code: 200, body: body}} ->
        Poison.decode!(body)

      # 404 Not found Error
      {:ok, %{status_code: 404}} ->
        nil
    end
  end

  def last_day_blocks do
    case HTTPoison.get("https://blockchain.info/blocks/1493420570000?format=json") do
      {:ok, %{status_code: 200, body: body}} -> Poison.decode!(body)
      {:ok, %{status_code: 404}} -> "404 Not found Error"
    end
  end

  def get_block_by_hash(hash) do
    IO.puts("https://blockchain.info/rawblock/#{hash}")

    case HTTPoison.get("https://blockchain.info/rawblock/#{hash}", [timeout: 50000],
           recv_timeout: 50000
         ) do
      {:ok, %{status_code: 200, body: body}} -> Poison.decode!(body)
      true -> "404 Not found Error"
    end

    #   cosa = HTTPoison.get("https://blockchain.info/rawblock/#{hash}", [timeout: 50000], [recv_timeout: 50000])
    # IO.puts cosa
  end

  def get_tx_by_hash(hash) do
    case HTTPoison.get("#{@tx_url}#{hash}") do
      {:ok, %{status_code: 200, body: body}} -> Poison.decode!(body)
      {:ok, %{status_code: 404}} -> "404 Not found Error"
    end
  end
end
