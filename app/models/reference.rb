class Reference < ActiveRecord::Base
  belongs_to :user

  validates :author, :title, :publisher, :year, presence: true, if: "reference_type=='book'"
  validates :author, :title, :journal, :year, :volume, presence: true, if: "reference_type=='article'"
  validates :author, :title, :booktitle, :year, presence: true, if: "reference_type=='inproceeding'"
  validates :year, :volume, :month, :series, numericality: { allow_blank: true }
end
