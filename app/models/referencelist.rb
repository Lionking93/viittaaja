class Referencelist < ActiveRecord::Base
  belongs_to :user
  has_many :references

  def to_s
    return self.name.to_s
  end
end
