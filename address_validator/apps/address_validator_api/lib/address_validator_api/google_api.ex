defmodule AddressValidatorApi.GoogleApi do
  @api_url "https://maps.googleapis.com/maps/api/geocode/json"
  @api_key "AIzaSyCkwyRpvYKMnWX0JoR7VoO4oDNUhI5UWJQ"

  @docmodule """
  Modulo wrapper para la API de Google Maps
  """

  def address_validate(address) do
    address
    |> build_url
    |> api_call
  end

  def build_url(address) do
    "#{@api_url}?address=#{address}&key=#{@api_key}"
    |> URI.encode
  end

  def api_call(url) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
          {:ok, Poison.decode!(body)}
      {:ok, %HTTPoison.Response{status_code: status}} ->
          {:error, status}
      {:error, %HTTPoison.Error{reason: reason}} ->
          {:error, reason}
      end
  end
end