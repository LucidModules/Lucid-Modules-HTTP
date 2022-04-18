defmodule LmHttp.TestClient do
  @moduledoc """
  This is a Test Client with a mocked adapter.
  """
  use LmHttp.Client, adapter: LmHttp.ClientAdapterMock
end
