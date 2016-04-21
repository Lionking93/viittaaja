module BibtexConverter
  extend ActiveSupport::Concern

  def convert(data)
    all_converted = []

    data.each do |datum|
      all_converted << convert_one(datum)
    end

    all_converted
  end

  def convert_one(data)
    converted = []

    converted << "@Book{#{data.id}," if data.reference_type == 'book'
    converted << "@Article{#{data.id}," if data.reference_type == 'article'
    converted << "@Inproceedings{#{data.id}," if data.reference_type == 'inproceeding'
    converted << "year = {#{data.year}}," unless data.year.nil?
    converted << "publisher = {#{self.fix_special(data.publisher)}}," unless data.publisher.nil? || data.publisher.empty?
    converted << "author = {#{self.fix_special(data.author)}}," unless data.author.nil? || data.author.empty?
    converted << "title = {#{self.fix_special(data.title)}}," unless data.title.nil? || data.title.empty?
    converted << "address = {#{self.fix_special(data.address)}}," unless data.address.nil? || data.address.empty?
    converted << "pages = {#{self.fix_special(data.pages)}}," unless data.pages.nil? || data.pages.empty?
    converted << "volume = {#{data.volume}}," unless data.volume.nil?
    converted << "edition = {#{self.fix_special(data.edition)}}," unless data.edition.nil? || data.edition.empty?
    converted << "month = {#{data.month}}," unless data.month.nil? || data.month.empty?
    converted << "series = {#{data.series}}," unless data.series.nil?
    converted << "note = {#{self.fix_special(data.note)}}," unless data.note.nil? || data.note.empty?
    converted << "journal = {#{self.fix_special(data.journal)}}," unless data.journal.nil? || data.journal.empty?
    converted << "number = {#{data.number}}," unless data.number.nil?
    converted << "key = {#{self.fix_special(data.key)}}," unless data.key.nil? || data.key.empty?
    converted << "booktitle {#{self.fix_special(data.booktitle)}}," unless data.booktitle.nil? || data.booktitle.empty?
    converted << "editor {#{self.fix_special(data.editor)}}," unless data.editor.nil? || data.editor.empty?
    converted << "organization {#{self.fix_special(data.organization)}}," unless data.organization.nil? || data.organization.empty?
    converted << "}"

    converted
  end

  def fix_special(str)
    str.gsub! 'Ä', '\\"{A}'
    str.gsub! 'ä', '\\"{a}'
    str.gsub! 'Ö', '\\"{O}'
    str.gsub! 'ö', '\\"{o}'
    str.gsub! 'Å', '\\AA'
    str.gsub! 'å', '\\aa'
    str
  end

end