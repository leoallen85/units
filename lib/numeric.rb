class Numeric

  def self.add_unit(unit, name)
    define_method(name) do
      Quantity.new(self, unit)
    end
  end
end
