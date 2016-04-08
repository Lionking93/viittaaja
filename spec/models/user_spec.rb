require 'rails_helper'

RSpec.describe User, type: :model do
  it "has the username set correctly" do
    user = User.create username:"IsmoLaitela"

    expect(user.username).to eq("IsmoLaitela")
    expect(user.valid?).to be(true)
    expect(User.count).to eq(1)
  end

  it "shows username correctly" do
    user = User.create username:"IsmoLaitela"
    expect(user.to_s). to eq("IsmoLaitela")
  end
end
