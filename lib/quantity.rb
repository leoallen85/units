require "./lib/numeric"

# Understands how to work with units
class RatioQuantity < Quantity

  def +(other)
    raise UnitCategoryError unless valid_quantity?(other)
    self.class.new(amount + unit.convert(other.base), self.unit)
  end
end
