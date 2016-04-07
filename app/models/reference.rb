class Reference < ActiveRecord::Base
  belongs_to :referencelists, :foreign_key => "referencelist_id"
end
