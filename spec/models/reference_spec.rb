require 'rails_helper'

RSpec.describe Reference, type: :model do
  it "with proper inputs, is valid and is saved" do
    reference = Reference.create year:"2016", publisher:"Jorman Kustantamo", author:"Suppo Taalasmaa", title:"Ovi auki tai tapahtuu hirveitä", address:"Mikä?", pages:"666", volume:"1", edition:"Ensimmäinen painos", month:"1", series:"1", note:"hirveetä puuroo hyi"

    expect(reference.valid?).to be(true)
    expect(Reference.count).to eq(1)
  end

  it "with improper inputs is not valid and saved" do
    reference = Reference.create year:"mummo lol"

    expect(reference.valid?).to be(false)
    expect(Reference.count).to eq(0)
  end
end
