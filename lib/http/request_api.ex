defmodule LmHttp.RequestApi do
  @moduledoc """
  Behaviours for serializers converting struct into a raw HTTP request.
  """

  @type t :: module

  alias LmHttp.ClientAdapter
  alias LmHttp.RequestApi

  @doc """
  Serialize the Request into map
  """
  @callback serialize(RequestApi.t()) :: ClientAdapter.serialized_request()
end
