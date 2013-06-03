class Player < ActiveRecord::Base
  attr_accessible :at_bats, :games, :games_started, :given_name, :hit_by_pitch, :hits, :home_runs, :rbi, :runs, :sacrifice_flies, :steals, :surname, :walks
	
	# calculation to determine the batting average of the player
	def avg 
		# prevent divide by zero
		if (self[:at_bats] != 0)
			(self[:hits].to_i / self[:at_bats].to_f).round(3)
		else
			0
		end
	end
	
	#calculation to determine the On Base Percentage
	def obp 
		# prevent divide by zero
		if (self[:at_bats] != 0)		
			((self[:hits] + self[:walks] + self[:hit_by_pitch])/(self[:at_bats] + self[:walks] + self[:hit_by_pitch] + self[:sacrifice_flies].to_f)).round(3)
		else
			0
		end
	end
end
