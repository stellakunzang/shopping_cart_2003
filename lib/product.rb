class Product
  attr_reader :category, :name, :unit_price, :quantity

  def initialize(category, name, unit_price, quantity)
    @category = category
    @name = name
    @unit_price = unit_price
    @quantity = quantity
    @hoard = false
  end

  def total_price
    @unit_price * (@quantity.to_i)
  end

  def hoard
    @quantity = @quantity.to_i * 3
    @hoard = true
  end

  def is_hoarded?
    @hoard
  end
end
