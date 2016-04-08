require 'rails_helper'

RSpec.describe User, type: :model do
  it "has the username set correctly" do
    user = User.new username:"IsmoLaitela"

    expect(user.username).to eq("IsmoLaitela")
    expect(user.valid?).to be(true)
    expect(User.count).to eq(1)
  end

  it "with invalid inputs is not valid nor saved" do
    expect(user.valid?).to be(false)
    expect(User.count).to eq(0)
  end
end
