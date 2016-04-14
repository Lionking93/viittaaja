class Reference < ActiveRecord::Base
  belongs_to :user

  validates :author, :title, :publisher, :year, presence: true
  validates :year, :volume, :month, :series, numericality: { allow_blank: true }
end
