require "./lib/numeric"

# Understands how to represent capacity
class Unit
  attr_reader :base, :amount
  protected :base, :amount

  def initialize(amount, base)
    @amount = amount * base.amount
    @base = base
  end

  def self.create(amount, category, name)
    new(amount, category).tap do |unit|
      Numeric.add_unit(unit, name)
    end
  end

  def same_category?(other)
    category == other.category
  end

  def convert_to_base(quantity)
    quantity * amount
  end

  def convert(base_quantity)
    base_quantity / amount
  end

  protected

  def category
    base.category
  end

  class BaseUnit

    attr_reader :category

    def initialize(category)
      @category = category
    end

    def amount
      1
    end
  end

  TEASPOON = Unit.create(1, BaseUnit.new(:volume), :teaspoons)
  TABLESPOON = Unit.create(3, TEASPOON, :tablespoons)
  OUNCE = Unit.create(2, TABLESPOON, :ounces)

  INCH = Unit.create(1, BaseUnit.new(:distance), :inches)
  FOOT = Unit.create(12, INCH, :feet)
end
