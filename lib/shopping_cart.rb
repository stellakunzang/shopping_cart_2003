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

  def products_by_category(category)
    products_by_category = products.group_by { |product| product.category }
    products_by_category[category]
  end

  def details
    details = {}
    details[:name] = name
    details[:capacity] = capacity.to_i
    return details
     #returns a hash with name and capacity as keys and strings as values
  end

  def percentage_occupied
    ((total_number_of_products / capacity.to_f) * 100).round(2)
  end
end
