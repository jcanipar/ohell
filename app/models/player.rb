class Player < ActiveRecord::Base
	has_many :rounds

	def games_played
		if self.rounds.present?
			return self.rounds.size
		else 
			return 0
		end
   	end	
end
