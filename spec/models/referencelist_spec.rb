require 'rails_helper'

RSpec.describe Referencelist, type: :model do
  it "has the name set correctly" do
    referencelist = Referencelist.new referencelist:"Megalista"

    expect(referencelist.name).to eq("Megalista")
  end
end
