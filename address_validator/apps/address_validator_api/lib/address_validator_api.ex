defmodule AddressValidatorApi do
  @moduledoc """
  Documentation for AddressValidatorApi.
  """

  @doc """
  Validate a given address
  """
  def validate_address(address) do
    case address |> AddressValidatorApi.Server.address_validator do
      %{"results" => [%{"formatted_address" => formatted_address} | _t]}
        -> {:ok, formatted_address}
      %{"results" => [], "status" => "ZERO_RESULTS"}
        -> {:no_valid}
      :error
        -> :error
    end
  end
end
