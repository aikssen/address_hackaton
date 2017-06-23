defmodule AddressValidatorApi do
  @moduledoc """
  Documentation for AddressValidatorApi.
  """

  @doc """
  Hello world.

  ## Examples

      iex> AddressValidatorApi.hello
      :world

  """
  def validate_address(address) do
    #{:ok, "9 de julio, CABA, Argentina …"}
    #{:not_valid}
  end
end
