class Referencelist < ActiveRecord::Base
  belongs_to :user
  has_many :references

  validates :name, presence: true

  def to_s
    return self.name.to_s
  end
end
