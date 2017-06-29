  defmodule AddressValidatorApiSpec do
    @moduledoc """
    describe: wraps a set of tests against one functionality
    context: wraps a set of tests against one functionality under the same state

    describe > context > it

    describe "launch the rocket"
      context "all ready"
        it "launch the rocket"
      context "not ready"
        it "does not launch the rocket
    """
    use ESpec

    alias AddressValidatorApi.GoogleApi

    before do
      api_call_mock = fn
          ("https://maps.googleapis.com/maps/api/geocode/json?address=Buenos%20Aires") ->
            {:ok,
            %HTTPoison.Response{
                body: "{\"results\" : [ { \"address_components\" : [ { \"long_name\" : \"Buenos Aires\", \"short_name\" : \"CABA\", \"types\" : [ \"locality\", \"political\" ] }, { \"long_name\" : \"Buenos Aires\", \"short_name\" : \"CABA\", \"types\" : [ \"administrative_area_level_1\", \"political\" ] }, { \"long_name\" : \"Argentina\", \"short_name\" : \"AR\", \"types\" : [ \"country\", \"political\" ] } ], \"formatted_address\" : \"Buenos Aires, Argentina\", \"geometry\" : { \"bounds\" : { \"northeast\" : { \"lat\" : -34.5265464, \"lng\" : -58.33514470000001 }, \"southwest\" : { \"lat\" : -34.7051011, \"lng\" : -58.5314522 } }, \"location\" : { \"lat\" : -34.6036844, \"lng\" : -58.3815591 }, \"location_type\" : \"APPROXIMATE\", \"viewport\" : { \"northeast\" : { \"lat\" : -34.5265464, \"lng\" : -58.33518840000001 }, \"southwest\" : { \"lat\" : -34.704922, \"lng\" : -58.5314522 } } }, \"place_id\" : \"ChIJvQz5TjvKvJURh47oiC6Bs6A\", \"types\" : [ \"locality\", \"political\" ] } ], \"status\" : \"OK\" }",
                headers: [],
                status_code: 200
              }
            }
          ("https://maps.googleapis.com/maps/api/geocode/json?address=CDMX") ->
            {:ok,
            %HTTPoison.Response{
                body: "{\"results\" : [ { \"address_components\" : [ { \"long_name\" : \"Mexico City\", \"short_name\" : \"MÃ©xico D.F.\", \"types\" : [ \"locality\", \"political\" ] }, { \"long_name\" : \"Mexico City\", \"short_name\" : \"CDMX\", \"types\" : [ \"administrative_area_level_1\", \"political\" ] }, { \"long_name\" : \"Mexico\", \"short_name\" : \"MX\", \"types\" : [ \"country\", \"political\" ] } ], \"formatted_address\" : \"Mexico City, CDMX, Mexico\", \"geometry\" : { \"bounds\" : { \"northeast\" : { \"lat\" : 19.5927571, \"lng\" : -98.9604482 }, \"southwest\" : { \"lat\" : 19.1887101, \"lng\" : -99.3267771 } }, \"location\" : { \"lat\" : 19.4326077, \"lng\" : -99.133208 }, \"location_type\" : \"APPROXIMATE\", \"viewport\" : { \"northeast\" : { \"lat\" : 19.5927571, \"lng\" : -98.9604482 }, \"southwest\" : { \"lat\" : 19.1887101, \"lng\" : -99.3267771 } } }, \"place_id\" : \"ChIJB3UJ2yYAzoURQeheJnYQBlQ\", \"types\" : [ \"locality\", \"political\" ] } ], \"status\" : \"OK\" }",
                headers: [],
                status_code: 200
              }
            }
          ("https://maps.googleapis.com/maps/api/geocode/json?address=zxcvb%20tyuio") ->
            {:ok,
            %HTTPoison.Response{
                body: "{\"results\" : [],\"status\" : \"ZERO_RESULTS\"}",
                headers: [],
                status_code: 200
              }
            }
          ("https://maps.googleapis.com/maps/api/geocode/json?address=") ->
                  {:ok,
                    %HTTPoison.Response{
                      body: "{\"error_message\" : \"Invalid request. Missing the 'address', 'bounds', 'components', 'latlng' or 'place_id' parameter.\",\"results\" : [],\"status\" : \"INVALID_REQUEST\"}",
                      headers: [],
                      status_code: 400
                    }
                  }
      end

      # allows to response to the api calls with a mocked data
      allow HTTPoison |> to(accept(:get, api_call_mock))
    end

    describe "Address validation" do

      context "Given a address as paremeter" do

        it "should create a valid url" do
          expect GoogleApi.build_url("broadway 2500") |> to(eq(shared.url))
        end

        it "" do
          
        end

        # it "should validate one word like direction" do
        #   "CDMX"
        #   |> AddressValidatorApi.get_response_from_api
        #   |> expect
        #   |> to(eq("Mexico City, CDMX, Mexico"))
        # end
      end
    end
  end