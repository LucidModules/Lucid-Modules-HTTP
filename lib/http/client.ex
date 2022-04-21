defmodule LmHttp.Client do
  @moduledoc """
  This is a client implementation that picks a client specified in the configuration.

  Configure the current client adapter:
  use LmHttp.Client, adapter: MyClient
  """

  defmacro __using__(opts) do
    quote bind_quoted: [opts: opts] do
      require Logger

      @behaviour LmHttp.ClientAdapter

      {adapter} = LmHttp.ClientConfig.compile_config!(opts)

      @adapter adapter

      @spec request(ClientAdapter.serialized_request()) :: ClientAdapter.result()
      @doc """
      Generic request.
      """
      @impl true
      def request(serialized_request) do
        @adapter.request(serialized_request)
      end
    end
  end
end
