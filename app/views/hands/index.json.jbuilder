json.array!(@hands) do |hand|
  json.extract! hand, :id, :bid, :got, :player_id, :round_num, :game_id
  json.url hand_url(hand, format: :json)
end
