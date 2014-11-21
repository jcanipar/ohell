json.array!(@players) do |player|
  json.extract! player, :id, :firstname, :lastname, :nickname, :team
  json.url player_url(player, format: :json)
end
