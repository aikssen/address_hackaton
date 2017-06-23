defmodule AddressValidatorApi.Server do
    use GenServer

    @moduledoc """
    """

    def start_link() do
        GenServer.start_link(__MODULE__, [], name: __MODULE__)
    end

    def address_validator(address) do
        GenServer.call(__MODULE__, {:address_validator, address})
    end

    def handle_call({:address_validator, address}, _from, state) do
        case AddressValidatorApi.GoogleApi.address_validate(address) do
            {:ok, body} -> {:reply, body, state}
            {:error, reason} -> {:reply, :error, state}
        end
    end
    
end