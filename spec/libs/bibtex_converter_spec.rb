require 'rails_helper'

RSpec.describe BibtexConverter, type: :lib do
  let(:dummy_class) { Class.new { include BibtexConverter } }
  it "Ää is converted" do
    conv = dummy_class.new
    str = "Ää"

    conv.fix_special(str)

    expect(str).to eq("\\\"{A}\\\"{a}")
  end

  it "Öö is converted" do
    conv = dummy_class.new
    str = "Öö"

    conv.fix_special(str)

    expect(str).to eq("\\\"{O}\\\"{o}")
  end

  it "Åå is converted" do
    conv = dummy_class.new
    str = "Åå"

    conv.fix_special(str)

    expect(str).to eq("\\AA\\aa")
  end

end

