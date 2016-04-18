class Reference < ActiveRecord::Base
  belongs_to :user

  validates :author, :title, :publisher, :year, presence: true, if: "reference_type=='book'"
  validate :drop_unnecessary_fields
  validates :author, :title, :journal, :year, :volume, presence: true, if: "reference_type=='article'"
  validates :author, :title, :booktitle, :year, presence: true, if: "reference_type=='inproceeding'"
  validates :year, :volume, :month, :series, numericality: { allow_blank: true }

  def drop_unnecessary_fields
  	if self.reference_type=='book'
  		self.journal = ''
  		self.pages = ''
  		self.booktitle = ''
  		self.address = ''
  		self.organization = ''
  	end
  	if self.reference_type=='article'
  		self.editor = ''
  		self.publisher = ''
  		self.series = ''
  		self.address = ''
  		self.edition = ''
  	end
  	if self.reference_type=='inproceeding'
  		self.edition = ''
  		self.journal = ''
  	end
  end
end
