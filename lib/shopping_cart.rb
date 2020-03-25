class ShoppingCart
  attr_reader :name, :capacity, :products, :total_number_of_products

  def initialize(name, capacity)
    @name = name
    @capacity = capacity.delete('items')
    @products = []
    @total_number_of_products = 0
  end

  def add_product(product)
    @products << product
  end

  def total_number_of_products
    @products.each do |product|
      @total_number_of_products += product.quantity.to_i
    end
    @total_number_of_products
  end

  def is_full?
    if total_number_of_products >= @capacity.to_i
      true
    else
      false
    end
  end

  def products_by_category

  end

  def details

  end
end
