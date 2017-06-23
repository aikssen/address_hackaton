defmodule AddressValidatorApi do
  @moduledoc """
  Documentation for AddressValidatorApi.
  """
  defstruct [:address, :response]

  @doc """
  Validate a given address
  """
  def validate_address(address) do
    # If addres is in cache return value from cache

    #else:
    case address |> AddressValidatorApi.Server.address_validator do
      %{"results" => [%{"formatted_address" => formatted_address} | _t]}
        -> {:ok, formatted_address}
      %{"results" => [], "status" => "ZERO_RESULTS"}
        -> {:not_valid}
      :error
        -> {:error}
    end
    # ssave: key/value, 
  end
end
