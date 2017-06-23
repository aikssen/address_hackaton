defmodule AddressValidatorApi.GoogleApiTest do
  use ExUnit.Case, async: true
  doctest AddressValidatorApi.GoogleApi

  setup do
    {:ok, url: "https://maps.googleapis.com/maps/api/geocode/json?address=broadway%202500&key=AIzaSyCkwyRpvYKMnWX0JoR7VoO4oDNUhI5UWJQ"}
  end

  test "Builds url", context do
    assert AddressValidatorApi.GoogleApi.build_url("broadway 2500") == context[:url]
  end
end
