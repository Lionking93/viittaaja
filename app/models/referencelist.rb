class Referencelist < ActiveRecord::Base
  belongs_to :users, :foreign_key => "user_id"

  def to_s
    return self.name.to_s
  end
end
