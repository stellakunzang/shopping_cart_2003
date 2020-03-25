class ShoppingCart
  attr_reader :name, :capacity, :products, :total_number_of_products

  def initialize(name, capacity)
    @name = name
    @capacity = capacity.delete('items').to_i
    @products = []
  end

  def add_product(product)
    @products << product
  end

  def total_number_of_products
    products.sum do |product|
      product.quantity
    end
    # total = 0
    # @products.each do |product|
    #   total += product.quantity
    # end
  end

  def is_full?
    total_number_of_products >= @capacity
    # if total_number_of_products >= @capacity
    #   true
    # else
    #   false
    # end
  end

  def products_by_category(category)
    @products.find_all {|product| product.category == category }
    # products_by_category = products.group_by { |product| product.category }
    # products_by_category[category]
  end

  def details
    details = {}
    details[:name] = name
    details[:capacity] = capacity
    details
  end

  def percentage_occupied
    ((total_number_of_products / capacity.to_f) * 100).round(2)
  end

  def sorted_products_by_quantity
    @products.sort_by { |product| product.quantity }.reverse
    # sorted_products = @products.sort_by { |product| product.quantity }
    # sorted_products.reverse

  end

  def product_breakdown
    product_breakdown = {}
    @products.each do |product|
      product_breakdown[product.category] = products_by_category(product.category)
    end
    product_breakdown
  end
end
