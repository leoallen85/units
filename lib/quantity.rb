require "./lib/unit"
require "./lib/numeric"

# Understands how to work with units
class Quantity

  attr_reader :amount, :unit
  protected   :amount, :unit

  def initialize(amount, unit)
    @amount = amount
    @unit = unit
  end

  def ==(other)
    return false unless valid_quantity?(other)
    self.base == other.base
  end

  def +(other)
    raise UnitCategoryError unless valid_quantity?(other)
    self.class.new(amount + unit.convert(other.base), self.unit)
  end

  protected

  def base
    unit.convert_to_base(amount)
  end

  private

  def valid_quantity?(other)
    same_type?(other) && same_category?(other)
  end

  def same_type?(other)
    other.is_a? Quantity
  end

  def same_category?(other)
    unit.same_category?(other.unit)
  end

  class UnitCategoryError < StandardError; end
end
