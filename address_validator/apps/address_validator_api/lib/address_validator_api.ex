defmodule AddressValidatorApi do
  @moduledoc """
  Documentation for AddressValidatorApi.
  """

  @doc """
  Validate a given address
  """
  def validate_address(address) do
    #{:ok, "9 de julio, CABA, Argentina …"}
    #{:not_valid}
  end
end
