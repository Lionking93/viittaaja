class Tag < ActiveRecord::Base
	has_and_belongs_to_many :references
	validate :name_to_downcase

	private
	def name_to_downcase
		self.name = self.name.downcase
	end
end
