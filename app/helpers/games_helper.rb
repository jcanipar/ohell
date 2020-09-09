module GamesHelper
	def total_correct(game)
		total_correct = 0
		game.rounds.each do |round|
			total_correct = total_correct + round.correct
		end
		return total_correct
	end

	def correct_rate(game)
		if game.numplay == 3
			available_bids = 33 * 3
		elsif game.numplay == 4 
			available_bids = 25 * 4
		elsif game.numplay == 5
			available_bids = 19 * 5
		end

		rate = ((total_correct(game).to_f / available_bids) * 100)
		
		return rate.round()
		
	end
end
