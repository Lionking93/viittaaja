class Reference < ActiveRecord::Base
  belongs_to :referencelist

  validates :author, :title, :publisher, :year,  presence: true
end
