defmodule AddressValidatorApi.GoogleApiTest do
  use ExUnit.Case, async: true
  use Plug.Test
  import Mock

  doctest AddressValidatorApi.GoogleApi

  setup do
    [url: "https://maps.googleapis.com/maps/api/geocode/json?address=broadway%202500&key=AIzaSyCkwyRpvYKMnWX0JoR7VoO4oDNUhI5UWJQ"]
  end

  test "Builds correctly the url for the api call", context do
    assert AddressValidatorApi.GoogleApi.build_url("broadway 2500") == context[:url]
  end

  test "Make a http request", context do
     with_mock HTTPoison, [get: fn(_url) -> {:ok, %HTTPoison.Response{}} end] do
      HTTPoison.get(context[:url])
      assert called HTTPoison.get(context[:url])
    end
  end

  test "Make a http request call api", context do
     with_mock HTTPoison, [get: fn(_url) -> {:ok,
           %HTTPoison.Response{
              body: "{\"results\" : [ { \"address_components\" : [ { \"long_name\" : \"Buenos Aires\", \"short_name\" : \"CABA\", \"types\" : [ \"locality\", \"political\" ] }, { \"long_name\" : \"Buenos Aires\", \"short_name\" : \"CABA\", \"types\" : [ \"administrative_area_level_1\", \"political\" ] }, { \"long_name\" : \"Argentina\", \"short_name\" : \"AR\", \"types\" : [ \"country\", \"political\" ] } ], \"formatted_address\" : \"Buenos Aires, Argentina\", \"geometry\" : { \"bounds\" : { \"northeast\" : { \"lat\" : -34.5265464, \"lng\" : -58.33514470000001 }, \"southwest\" : { \"lat\" : -34.7051011, \"lng\" : -58.5314522 } }, \"location\" : { \"lat\" : -34.6036844, \"lng\" : -58.3815591 }, \"location_type\" : \"APPROXIMATE\", \"viewport\" : { \"northeast\" : { \"lat\" : -34.5265464, \"lng\" : -58.33518840000001 }, \"southwest\" : { \"lat\" : -34.704922, \"lng\" : -58.5314522 } } }, \"place_id\" : \"ChIJvQz5TjvKvJURh47oiC6Bs6A\", \"types\" : [ \"locality\", \"political\" ] } ], \"status\" : \"OK\" }",
              headers: [],
              status_code: 200
            }
          } end] do
      resp = HTTPoison.get(context[:url])
      assert_response resp, fn(response) ->
        args = Poison.decode!(response.body)["args"]
        IO.inspect args
        assert args["results"] == ["long_name"]
        # assert args["baz"] == "bong"
        # assert args["bar"] == "zing"
        # assert (args |> Map.keys |> length) == 3
      end
    end
  end

  defp assert_response({:ok, response}, function \\ nil) do
    assert is_list(response.headers)
    assert response.status_code == 200
    assert is_binary(response.body)

    unless function == nil, do: function.(response)
  end
end
