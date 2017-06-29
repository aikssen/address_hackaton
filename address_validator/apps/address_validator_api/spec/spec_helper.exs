ESpec.configure fn(config) ->
  config.before fn(tags) ->
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=broadway%202500&key=AIzaSyCkwyRpvYKMnWX0JoR7VoO4oDNUhI5UWJQ"
    {:shared, url: url, tags: tags} #saves {:key, :value} to `shared`
    # {:shared, hello: :world, tags: tags}
  end

  config.finally fn(_shared) ->
    :ok
  end
end
