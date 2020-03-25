require 'minitest/autorun'
require 'minitest/pride'
require './lib/product'
require './lib/shopping_cart'
require 'pry'

class ShoppingCartTest < Minitest::Test

  def test_it_exists
    cart = ShoppingCart.new("King Soopers", "30items")

    assert_instance_of ShoppingCart, cart
  end

  def test_it_has_attributes
    cart = ShoppingCart.new("King Soopers", "30items")

    assert_equal 'King Soopers', cart.name
    assert_equal '30', cart.capacity
    assert_equal [], cart.products
  end

  def test_it_can_add_product
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    cart.add_product(product1)
    cart.add_product(product2)

    assert_equal [product1, product2], cart.products
  end

  def test_it_can_count_total_number_of_items
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)

    assert_equal 13, cart.total_number_of_products
  end

  def test_it_can_detect_if_full
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)

    assert_equal false, cart.is_full?

    product4 = Product.new(:produce, 'apples', 0.99, '20')
    cart.add_product(product4)

    assert_equal true, cart.is_full?
  end

  def test_it_can_sort_products_by_category
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    product4 = Product.new(:produce, 'apples', 0.99, '20')
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)
    cart.add_product(product4)

    assert_equal [product1, product3], cart.products_by_category(:paper)
  end

  def test_it_can_return_cart_details
    cart = ShoppingCart.new("King Soopers", "30items")

    assert_equal cart.details, {:name=> "King Soopers", :capacity=> 30}
  end

  def test_it_can_calculate_percentage_occupied
    cart = ShoppingCart.new("King Soopers", "30items")
    product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    product2 = Product.new(:meat, 'chicken', 4.50, '2')
    product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    cart.add_product(product1)
    cart.add_product(product2)
    cart.add_product(product3)

    assert_equal 43.33, cart.percentage_occupied
  end

  def test_it_can_sort_products_by_quantity
    cart = ShoppingCart.new("King Soopers", "30items")
    toilet_paper = Product.new(:paper, 'toilet paper', 3.70, '10')
    tissue_paper = Product.new(:paper, 'tissue paper', 1.25, '1')
    apples = Product.new(:produce, 'apples', 0.99, '20')
    chicken = Product.new(:meat, 'chicken', 4.50, '2')
    cart.add_product(toilet_paper)
    cart.add_product(tissue_paper)
    cart.add_product(apples)
    cart.add_product(chicken)

    assert_equal [apples, toilet_paper, chicken, tissue_paper], cart.sorted_products_by_quantity
  end

  def test_it_can_return_product_breakdown
    cart = ShoppingCart.new("King Soopers", "30items")
    toilet_paper = Product.new(:paper, 'toilet paper', 3.70, '10')
    tissue_paper = Product.new(:paper, 'tissue paper', 1.25, '1')
    apples = Product.new(:produce, 'apples', 0.99, '20')
    chicken = Product.new(:meat, 'chicken', 4.50, '2')
    cart.add_product(toilet_paper)
    cart.add_product(tissue_paper)
    cart.add_product(apples)
    cart.add_product(chicken)

    assert_equal cart.product_breakdown, {:paper => [toilet_paper, tissue_paper], :meat => [chicken], :produce => [apples]}
  end
end
