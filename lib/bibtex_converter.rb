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
    converted << "publisher = {#{data.publisher}}," unless data.publisher.nil?
    converted << "author = {#{data.author}}," unless data.author.nil?
    converted << "title = {#{data.title}}," unless data.title.nil?
    converted << "address = {#{data.address}}," unless data.address.nil?
    converted << "pages = {#{data.pages}}," unless data.pages.nil?
    converted << "volume = {#{data.volume}}," unless data.volume.nil?
    converted << "edition = {#{data.edition}}," unless data.edition.nil?
    converted << "month = {#{data.month}}," unless data.month.nil?
    converted << "series = {#{data.series}}," unless data.series.nil?
    converted << "note = {#{data.note}}," unless data.note.nil?

    converted << "}"

    converted
  end

  def fix_special(str)

  end

end