require 'teaspoon'

RSpec.describe Teaspoon do
  subject(:teaspoon) { described_class.new(1) }
  let(:two_teaspoons) { described_class.new(2) }
  let(:three_teaspoons) { described_class.new(3) }
  let(:tablespoon) { Tablespoon.new(2) }

  it "can be compared" do
    expect(teaspoon).to eq(described_class.new(1))
    expect(teaspoon).not_to eq(two_teaspoons)
    expect(teaspoon).not_to eq(Object.new)
    expect(teaspoon).not_to eq(nil)
  end

  it "adds" do
    expect(teaspoon + two_teaspoons).to eq(three_teaspoons)
    #expect(teaspoon + tablespoon).to eq(three_teaspoons)
  end
end
