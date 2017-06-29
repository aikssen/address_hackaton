defmodule AddressValidationRest.AddressControllerTest do
  use AddressValidationRest.ConnCase

  # alias AddressValidationRest.Address
  # @valid_attrs %{}
  # @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  # test "lists all entries on index", %{conn: conn} do
  #   conn = get conn, address_path(conn, :get)
  #   assert json_response(conn, 200)["formated_address"] == []
  # end
end
