class BibTexController < ApplicationController

  include BibtexConverter

  def index
    @bibtex = convert(Reference.all)
  end

end
