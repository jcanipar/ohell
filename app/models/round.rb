class Round < ActiveRecord::Base

   	belongs_to :game
   	belongs_to :player

   	default_scope :order => 'place ASC'

   	def tricks_taken 
   		self.score-(self.correct*10)
   	end



end
