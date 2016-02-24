require "./lib/numeric"

# Understands how to work with units
class Quantity

  attr_reader :amount, :unit
  protected   :amount, :unit

  EPSILON = 0.0001

  def initialize(amount, unit)
    @amount = amount
    @unit = unit
  end

  def ==(other)
    return false unless valid_quantity?(other)
    (self.base - other.base).abs < EPSILON
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
