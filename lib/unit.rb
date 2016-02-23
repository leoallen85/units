# Understands how to represent capacity
class Unit
  attr_reader :amount
  protected :amount

  def initialize(amount)
    @amount = amount
  end

  def self.create(amount, name)
    new(amount).tap do |unit|
      Numeric.add_unit(unit, name)
    end
  end

  def convert_to_base(quantity)
    quantity * amount
  end

  def convert(base_quantity)
    base_quantity / amount
  end

  TEASPOON = Unit.create(1, :teaspoons)
  TABLESPOON = Unit.create(3, :tablespoons)
  OUNCE = Unit.create(6, :ounces)
end
