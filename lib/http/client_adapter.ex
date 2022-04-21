defmodule LmHttp.ClientAdapter do
  @moduledoc """
  Behaviour for HTTP clients that should implement the request callback.
  """

  @type t :: module

  @type body :: map()
  @type query_params :: map()
  @type headers :: keyword()
  @type url :: String.t()

  @type endpoint :: String.t()
  @type http_method :: atom()

  @type serialized_request :: %{method: http_method, endpoint: endpoint, headers: headers, body: body}
  @type response :: %{status: integer(), body: body, headers: headers}
  @type result :: {:ok, response} | {:error, String.t()}

  @doc """
  Generic request.
  """
  @callback request(serialized_request) :: result
end
