defmodule LmHttp.ResponseApi do
  @moduledoc """
  Behaviour for modules that deserialize raw response into a struct.
  """

  @type t :: module

  alias LmHttp.ClientAdapter
  alias LmHttp.ResponseApi

  @doc """
  Deserialize raw response into response structure
  """
  @callback deserialize(ClientAdapter.response()) :: ResponseApi
end
