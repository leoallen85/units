class Numeric

  def self.add_unit(unit, name, quantity)
    define_method(name) do
      quantity.new(self, unit)
    end
  end

end
