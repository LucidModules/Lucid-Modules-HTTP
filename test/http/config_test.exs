defmodule LmHttp.ConfigTest do
  use ExUnit.Case, async: false

  import Mock

  alias LmHttp.Config
  alias LmHttp.ClientMock

  describe "given Application without configured client" do
    setup_with_mocks([
      {Application, [:passthrough],
       [
         get_env: &application_get_env_nil/3
       ]}
    ]) do
      :ok
    end

    test "it raises an exception" do
      assert_raise RuntimeError,
                   "Argument :client for :ueberauth_line LmHttp.Client is not configured",
                   fn ->
                     Config.get_client!()
                   end
    end
  end

  defp application_get_env(:ueberauth_line, LmHttp.Client, _) do
    [
      client: ClientMock
    ]
  end

  defp application_get_env_nil(:ueberauth_line, LmHttp.Client, _) do
    []
  end

  describe "given Application with configured client" do
    setup_with_mocks([
      {Application, [:passthrough],
       [
         get_env: &application_get_env/3
       ]}
    ]) do
      :ok
    end

    test "it returns the client" do
      assert ClientMock = Config.get_client!()
    end
  end
end
