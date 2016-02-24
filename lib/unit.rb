require "./lib/numeric"
require "./lib/quantity"
require "./lib/interval_quantity"

# Understands how to represent capacity
class Unit
  attr_reader :base, :multiplier, :offset
  protected :base, :multiplier, :offset

  def initialize(multiplier, base, offset = 0)
    @offset = offset
    @multiplier = multiplier * base.multiplier
    @base = base
  end

  def self.create(multiplier, category, name, offset = 0, quantity = Quantity)
    new(multiplier, category, offset).tap do |unit|
      Numeric.add_unit(unit, name, quantity)
    end
  end

  def same_category?(other)
    category == other.category
  end

  def convert_to_base(quantity)
    (quantity - offset) * multiplier
  end

  def convert(base_quantity)
    base_quantity * 1 / multiplier + self.offset
  end

  protected

  def category
    base.category
  end

  class BaseUnit

    attr_reader :category, :interval

    def initialize(category)
      @category = category
    end

    def multiplier
      1
    end

  end

  TEASPOON = Unit.create(1, BaseUnit.new(:volume), :teaspoons)
  TABLESPOON = Unit.create(3, TEASPOON, :tablespoons)
  OUNCE = Unit.create(2, TABLESPOON, :ounces)

  INCH = Unit.create(1, BaseUnit.new(:distance), :inches)
  FOOT = Unit.create(12, INCH, :feet)

  CELSIUS = Unit.create(1, BaseUnit.new(:temperature), :celsius, 0, IntervalQuantity)
  FAHRENHEIT = Unit.create(5/9.0, CELSIUS, :fahrenheit, 32, IntervalQuantity)
end
