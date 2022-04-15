defmodule LmHttp.Config do
  @moduledoc """
  Configuration for the LmHttp Client API.
  """

  def get_client! do
    config = Application.get_env(:ueberauth_line, LmHttp.Client, [])

    case config[:client] do
      nil -> raise "Argument :client for :ueberauth_line LmHttp.Client is not configured"
      client -> client
    end
  end
end
