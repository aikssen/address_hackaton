defmodule AddressValidatorApi do
  @moduledoc """
  Documentation for AddressValidatorApi.
  """

  @doc """
  Validate a given address
  """
  def validate_address(address) do
    %{"results" => [%{"formatted_address" => formatted_address} | _t]} = address
    |> AddressValidatorApi.Server.address_validator
    formatted_address
  end
end
