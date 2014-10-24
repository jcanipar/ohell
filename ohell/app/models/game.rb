class Game < ActiveRecord::Base

    has_many :rounds
	accepts_nested_attributes_for :rounds
	
end
