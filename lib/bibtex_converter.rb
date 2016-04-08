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

    converted << "@Book{#{data.id},"
    converted << "year = {#{data.year}}," unless data.year.nil?
    converted << "publisher = {#{self.fix_special(data.publisher)}}," unless data.publisher.nil?
    converted << "author = {#{self.fix_special(data.author)}}," unless data.author.nil?
    converted << "title = {#{self.fix_special(data.title)}}," unless data.title.nil?
    converted << "address = {#{self.fix_special(data.address)}}," unless data.address.nil?
    converted << "pages = {#{self.fix_special(data.pages)}}," unless data.pages.nil?
    converted << "volume = {#{data.volume}}," unless data.volume.nil?
    converted << "edition = {#{self.fix_special(data.edition)}}," unless data.edition.nil?
    converted << "month = {#{data.month}}," unless data.month.nil?
    converted << "series = {#{data.series}}," unless data.series.nil?
    converted << "note = {#{self.fix_special(data.note)}}," unless data.note.nil?
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