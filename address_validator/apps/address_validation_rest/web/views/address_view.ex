defmodule AddressValidationRest.AddressView do
  use AddressValidationRest.Web, :view

  def render("index.json", %{addresses: addresses}) do
    %{data: render_many(addresses, AddressValidationRest.AddressView, "address.json")}
  end

  def render("show.json", %{address: address}) do
    %{data: render_one(address, AddressValidationRest.AddressView, "address.json")}
  end

  def render("address.json", %{address: address}) do
    %{formatted_address: address, valid_address: true}
  end

  def render("invalid_address.json", _) do
    %{valid_address: false}
  end

  def render("500.json", _) do
    "Internal server error"
  end
end
