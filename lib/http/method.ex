defmodule LmHttp.Method do
  @moduledoc """
  HTTP methods provider.
  """

  @allowed_methods [:head, :get, :post, :put, :patch, :delete, :connect, :options, :trace]

  @spec get_all :: list()
  def get_all do
    @allowed_methods
  end
end
