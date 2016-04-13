class Book < ActiveRecord::Base

	scope :finished, -> { where.not(finished_on: nil) }


	#scope :recent, -> {where('finished_on > ?', 2.days.ago)}

	# scope can also be written as a class method as in the example below
	# using self. makes it a class method
	# query methods as class methods

	def self.recent
		where('finished_on > ?', 2.days.ago)
	end

	def finished?
		finished_on.present?
	end

end
