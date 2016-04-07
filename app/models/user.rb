class User < ActiveRecord::Base


  has_many :references, through: :referencelists
  has_many :referencelists

  def to_s
    return self.username.to_s
  end

end
