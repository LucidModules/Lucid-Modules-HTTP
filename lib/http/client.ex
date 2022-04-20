defmodule LmHttp.Client do
  @moduledoc """
  This is a client implementation that picks a client specified in the configuration.

  Configure the current client adapter:
  use LmHttp.Client, adapter: MyClient
  """

  defmacro __using__(opts) do
    quote bind_quoted: [opts: opts] do
      @behaviour LmHttp.ClientAdapter

      {adapter, logger} = LmHttp.ClientConfig.compile_config!(opts)

      @adapter adapter
      @logger logger

      @spec request(ClientAdapter.serialized_request()) :: ClientAdapter.result()
      @doc """
      Generic request.
      """
      @impl true
      def request(serialized_request) do
        @adapter.request(serialized_request)
        |> maybe_debug_log(serialized_request)
      end

      defp maybe_debug_log(response, request) do
        case @logger do
          nil ->
            response

          logger ->
            logger.debug("#{__MODULE__} log:", request: request, response: response)
        end

        response
      end
    end
  end
end
