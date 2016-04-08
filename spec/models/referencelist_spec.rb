require 'rails_helper'

RSpec.describe Referencelist, type: :model do
  it "has the name set correctly" do
    referencelist = Referencelist.create name:"Megalista"

    expect(referencelist.name).to eq("Megalista")
    expect(referencelist.valid?).to be(true)
    expect(Referencelist.count).to eq(1)
  end

  it "shows the name correctly" do
  	referencelist = Referencelist.create name:"Megalista"
  	expect(referencelist.to_s).to eq("Megalista")
  end
end
