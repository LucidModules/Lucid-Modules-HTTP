defmodule LmHttp.Client do
  @moduledoc """
  This is a client implementation that picks a client specified in the configuration.

  Configure the current client in
  config :ueberauth_line, LmHttp.Client,
    client: MyClient
  """

  alias LmHttp.Config

  @behaviour LmHttp.ClientApi

  @spec request(ClientApi.serialized_request()) :: ClientApi.result()
  @doc """
  Generic request.
  """
  @impl true
  def request(serialized_request) do
    Config.get_client!().request(serialized_request)
  end
end
