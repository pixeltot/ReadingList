class Book < ActiveRecord::Base
	
	has_many :book_genres
	has_many :genres, through: :book_genres

	before_save :set_keywords

	scope :finished, -> { where.not(finished_on: nil) }
	scope :recent, -> { where('finished_on > ?', 2.days.ago)}
	scope :search, -> (keyword){ where('keywords LIKE ?', "%#{keyword.downcase}%") if keyword.present? } 
	# scope :filter, -> (genre_id){ joins(:book_genres).where(book_genres: { genre_id: genre_id }) }
	scope :filter, ->(name){ 
		joins(:genres).where('genres.name = ?', name) if name.present?
	}
	

	# scope can also be written as a class method as in the example below
	# using self. makes it a class method
	# query methods as class methods

	# def self.search(keyword)
	#	if keyword.present?
	#		where(title: keyword)
	#	else
	#		all
	#	end
	# end

	def self.recent
		where('finished_on > ?', 2.days.ago)
	end

	def finished?
		finished_on.present?
	end

	protected
		def set_keywords
			# self.keywords = [title, author, description].map { |p| p.downcase }
			# or
			self.keywords = [title, author, description].map(&:downcase).join(' ')
		end
end
