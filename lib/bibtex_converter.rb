module BibtexConverter
  extend ActiveSupport::Concern

  def convert(data)
    data.map { |datum| convert_one(datum) }
  end

  def convert_one(data)
    converted = []
    fields = [:year, :publisher, :author, :title, :address, :pages, :volume, :edition,
              :month, :series, :note, :journal, :number, :key, :booktitle, :editor, :organization]

    converted << "@#{data.reference_type.humanize}#{data.reference_type == 'inproceeding' ? 's' : ''}{#{data.citation_key},"

    fields.map do |f|
      converted << "    #{f.to_s} = {#{fix_special((f == :author or f == :editor) ? data.send(f, true) : data.send(f))}}," unless data.send(f).blank?
    end

    converted << '}'
  end

  def fix_special(str)
    return str unless str.is_a? String
    fix = { 'Ä' => '\\"{A}', 'ä' => '\\"{a}', 'Ö' => '\\"{O}', 'ö' => '\\"{o}', 'Å' => '\\AA', 'å' => '\\aa' }

    fix.map { |from, to| str.gsub! from, to }

    str
  end

end
