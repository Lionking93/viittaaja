class User < ActiveRecord::Base

  has_many :references

  validates :username, length: { minimum: 3, maximum: 15 }, uniqueness: true

  def to_s
    return self.username.to_s
  end

end
