defmodule GrowthBook.FeatureRepository.HttptcClient do
  @moduledoc false

  def get(url) do
    case :httpc.request(:get, {String.to_charlist(url), []}, [], []) do
      {:ok, {{_, status, _}, _headers, body}} -> {:ok, status, List.to_string(body)}
      {:error, reason} -> {:error, reason}
    end
  end
end
