json.array!(@games) do |game|
  json.extract! game, :id, :date, :numPlay, :league
  json.url game_url(game, format: :json)
end
