defmodule AddressValidatorApi do
  @moduledoc """
  Documentation for AddressValidatorApi.
  """
  defstruct [:address, :response]

  alias AddressValidatorApi.Repo
  alias AddressValidatorApi.Address

  @doc """
  Validate a given address
  """
  def validate_address(address) do
    # If addres is in cache return value from cache
    response = Repo.get_by(Address, address: address)
    case response do
      %Address{response: "ZERO_RESULTS"}
        -> {:not_valid, "ZERO_RESULTS"}
      %Address{response: "Server Error"}
        -> {:error, "Server Error"}
      %Address{response: cache_response}
        -> {:ok, cache_response}
      nil
        -> get_response_from_api(address)
    end
  end

  def get_response_from_api(address) do
    response = case address |> AddressValidatorApi.Server.address_validator do
      %{"results" => [%{"formatted_address" => formatted_address} | _t]}
        -> {:ok, formatted_address}
      %{"results" => [], "status" => zero_results}
        -> {:not_valid, zero_results}
      :error
        -> {:error, "Server Error"}
    end
    {_, save_data} = response
    Repo.insert(%Address{address: address, response: save_data})
    response
  end
end
