class Tag < ActiveRecord::Base
  has_many :references_tags
  has_many :references, through: :references_tags

  validate :name_to_downcase

  private
  def name_to_downcase
    self.name = self.name.downcase
  end
end
