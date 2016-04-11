require 'rails_helper'

describe 'Referencelist page' do

  before :each do
    @list = Referencelist.create name:"lista"
  end

  it 'lists all current references' do


  end

  it 'when a new reference is added, shows it on the page' do

  end

  it 'when bibtex-button is pressed, opens up a page showing references in bibtex format' do
    @list.references.create year:1990, author:"Barack Öbämå", title:"USA", publisher:"asd"

    visit referencelist_path(@list)

    click_link "Bibtex"

    expect(page).to have_content "Bibtex for lista"
    expect(page).to have_content "@Book{1,
                                  year = {1990},
                                  publisher = {asd},
                                  author = {Barack \\\"{O}b\\\"{a}m\\aa},
                                  title = {USA},
                                  }"
  end

end

