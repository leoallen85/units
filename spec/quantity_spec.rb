require 'quantity'

describe Quantity do

  it "can compare two quantities of the same unit" do
    expect(2.teaspoons).to eq(2.teaspoons)
    expect(2.teaspoons).to_not eq(nil)
  end

  it "can compare two quantities of the different unit" do
    expect(2.teaspoons).to_not eq(2.tablespoons)
  end

  it "can add two quantities of the same unit" do
    expect(2.teaspoons + 2.teaspoons).to eq(4.teaspoons)
  end

  it "can add two quantities of different unit" do
    expect(2.teaspoons + 2.tablespoons).to eq(8.teaspoons)
    expect(2.ounces + 2.tablespoons).to eq(3.ounces)
    expect(2.tablespoons + 2.ounces).to eq(3.ounces)
    expect(2.feet).to eq(24.inches)
  end

  it "can not add two quantities of different categories" do
    expect { 2.feet + 2.tablespoons }.to raise_error(Quantity::UnitCategoryError)
    expect { 2.feet + nil }.to raise_error(Quantity::UnitCategoryError)
  end

  it "considers similar quantities with different unit types as different" do
    expect(2.inches).not_to eq(2.teaspoons)
    expect(2.tablespoons).not_to eq(4.feet)
  end
end

