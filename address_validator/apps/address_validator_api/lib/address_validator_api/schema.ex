defmodule AddressValidatorApi.Address do
  use Ecto.Schema

  schema "addresses" do
    field :address, :string
    field :response, :string

    timestamps()
  end
end