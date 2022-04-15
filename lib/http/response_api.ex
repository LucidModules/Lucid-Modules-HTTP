defmodule LmHttp.ResponseApi do
  @moduledoc """
  Behaviour for modules that deserialize raw response into a struct.
  """

  @type t :: module

  alias LmHttp.ClientApi
  alias LmHttp.ResponseApi

  @doc """
  Deserialize raw response into response structure
  """
  @callback deserialize(ClientApi.response()) :: ResponseApi
end
