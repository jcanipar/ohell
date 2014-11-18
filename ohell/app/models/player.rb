class Player < ActiveRecord::Base
	has_many :rounds

	def games_played
		return self.rounds.size
   	end	
end
