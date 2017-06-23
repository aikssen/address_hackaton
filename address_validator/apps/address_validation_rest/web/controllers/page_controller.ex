defmodule AddressValidationRest.PageController do
  use AddressValidationRest.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
