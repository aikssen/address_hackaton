defmodule AddressValidationRest.AddressController do
  use AddressValidationRest.Web, :controller

  alias AddressValidationRest.Address

  def index(conn, _params) do
    addresses = Repo.all(Address)
    render(conn, "index.json", addresses: addresses)
  end

  def get(conn, %{"address" => address}) do
    case address |> AddressValidatorApi.validate_address do
      {:ok, validated_address} -> render(conn, "address.json", address: validated_address)
      {:not_valid} -> render(conn, "invalid_address.json")
      {:error} -> conn |> put_status(500) |> render("500.json")
    end
  end
end
