# frozen_string_literal: true

RSpec.describe Chat do
  it "has a version number" do
    expect(Chat::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
