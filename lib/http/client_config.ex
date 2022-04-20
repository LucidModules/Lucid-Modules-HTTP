defmodule LmHttp.ClientConfig do
  @moduledoc """
  LmHttp configuration parser.
  """

  @type client_config :: {LmHttp.ClientAdapter, Logger}

  @spec compile_config!(keyword) :: client_config
  def compile_config!(opts) do
    adapter =
      get_config!(opts, :adapter)
      |> ensure_compiled!()
      |> ensure_implements_behaviour!(LmHttp.ClientAdapter, :adapter)

    logger = get_config!(opts, :logger, [:optional])

    {adapter, logger}
  end

  defp get_config!(opts, field_name, opts \\ [])
  defp get_config!(opts, field_name, [:optional]), do: Keyword.get(opts, field_name)

  defp get_config!(opts, field_name, _) do
    value = Keyword.get(opts, field_name)

    unless value do
      raise ArgumentError, "missing #{field_name} option on use LmHttp.Client"
    end

    value
  end

  defp ensure_compiled!(module) do
    if Code.ensure_compiled(module) != {:module, module} do
      raise ArgumentError,
            "adapter #{inspect(module)} was not compiled, " <>
              "ensure it is correct and it is included as a project dependency"
    end

    module
  end

  defp ensure_implements_behaviour!(module, behaviour, key_name) do
    behaviours =
      for {:behaviour, behaviours} <- module.__info__(:attributes),
          behaviour <- behaviours,
          do: behaviour

    unless behaviour in behaviours do
      raise ArgumentError,
            "expected #{key_name} option given to LmHttp.Client to list #{behaviour} as a behaviour"
    end

    module
  end
end
