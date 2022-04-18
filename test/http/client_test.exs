defmodule LmHttp.ClientTest do
  use ExUnit.Case, async: true

  alias LmHttp.TestClient

  describe "given Client with configured adapter" do
    test "it executes request" do
      serialized = %{
        method: :post,
        endpoint: "https://example.com/url",
        headers: %{
          foo: :bar
        },
        body: %{
          param: :foobar
        }
      }

      assert %{
               mocked: ^serialized
             } = TestClient.request(serialized)
    end
  end
end
