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
    return false unless other.is_a? Quantity
    self.base == other.base
  end

  def +(other)
    self.class.new(amount + unit.convert(other.base), self.unit)
  end

  protected

  def base
    unit.convert_to_base(amount)
  end
end
