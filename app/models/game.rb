class Game < ActiveRecord::Base

   has_many :rounds, -> { order 'place desc' }, dependent: :destroy
   #:order => 'place DESC'
	accepts_nested_attributes_for :rounds

   	def winner_by_id
   		r = self.rounds
   		r = r.sort_by{|e| -e[:score]}
   		return r.first.player_id
   	end	

   	def winner_by_nickname
   		r = self.rounds
   		r = r.sort_by{|e| -e[:score]}
   		return r.first.player.nickname
   	end

   	def winner
   		r = self.rounds
         puts r
   		r = r.sort_by{|e| -e[:score]}
   		return r.first.player
   	end
end
