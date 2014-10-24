json.array!(@rounds) do |round|
  json.extract! round, :id, :game_id, :score, :place, :correct, :asterisk, :player_id
  json.url round_url(round, format: :json)
end
