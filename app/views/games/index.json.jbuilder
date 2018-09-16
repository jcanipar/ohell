json.array!(@games) do |game|
  json.extract! game, :id, :date, :numplay, :league
  json.url game_url(game, format: :json)
end
