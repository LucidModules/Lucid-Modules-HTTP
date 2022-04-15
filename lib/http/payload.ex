defmodule LmHttp.Payload do
  @moduledoc """
  Payload content filter functions.
  """

  defp map_reject_nil({_key, val}) when is_nil(val), do: true
  defp map_reject_nil({_, _}), do: false

  def remove_nils(payload) when is_map(payload) do
    Map.reject(payload, &map_reject_nil/1)
  end

  def remove_nils(payload), do: payload
end
