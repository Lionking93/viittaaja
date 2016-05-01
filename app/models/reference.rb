class Reference < ActiveRecord::Base
  has_many :references_tags
  has_many :tags, through: :references_tags

  validates :title, :publisher, :year, presence: true, if: "reference_type=='book'"
  validates :author, :title, :journal, :year, :volume, presence: true, if: "reference_type=='article'"
  validates :author, :title, :booktitle, :year, presence: true, if: "reference_type=='inproceeding'"
  validates :year, :volume, :series, numericality: { allow_blank: true }

  validate :author_xor_editor
  validate :drop_unnecessary_fields

  scope :books, -> { where reference_type: 'book' }
  scope :articles, -> { where reference_type: 'article' }
  scope :inproceedings, -> { where reference_type: 'inproceeding' }


  def generate_citation_key(addition = '')
    names = ""

    self.creators.each { |c| names += c[0,2].downcase }

    key = "#{names}#{self.year}#{addition}"

    nextChar = addition.empty? ? 'a' : (addition.ord + 1).chr
    key = self.generate_citation_key(nextChar) if Reference.where(citation_key:key).any?

    key
  end

  def creator
    return editor if author.nil? or author.empty?
    author
  end

  def creators
    creator.split(',').map { |c| c.strip }
  end

  private
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
  		self.series = ''
  		self.edition = ''
  	end
  	if self.reference_type=='inproceeding'
  		self.edition = ''
  		self.journal = ''
  	end
  end

  private
  def author_xor_editor
    if reference_type=='book'
      unless author.blank? ^ editor.blank?
        errors.add(:author, 'or editor must be specified, but not both')
        errors.add(:editor, 'or author must be specified, but not both')
      end
    end
  end
end
