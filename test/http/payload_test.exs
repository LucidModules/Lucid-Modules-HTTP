defmodule LmHttp.PayloadTest do
  use ExUnit.Case, async: true

  alias LmHttp.Payload

  describe "given Payload" do
    test "it converts map to keywords" do
      payload = %{
        "param" => "foobar",
        "foo" => "bar",
      }

      assert [{:foo, "bar"}, {:param, "foobar"}] = Payload.to_keyword(payload)
    end
  end
end
