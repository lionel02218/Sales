require "test_helper"

class ProductTest < ActiveSupport::TestCase
  def product
    @product ||= Product.new
  end

  def test_valid
    assert_not product.valid?
    product.category_id=1
    product.name = "Book1"
    product.quantity = "1"
    product.price = 12.49

    assert product.valid?
  end

  def test_product_sales_tax
    puts "testing the product's sales taxes..."
    puts "input 1"
    a1 = products :a1
    puts "a1 product price: #{a1.price}, name: #{a1.name}, tax_rate: #{a1.taxes}"
    assert_equal(a1.price, a1.price_with_tax)

    a2 = products :a2
    puts "a2 product price: #{a2.price}, name: #{a2.name}, tax_rate: #{a2.taxes}"
    assert_not_equal(a2.price, a2.price_with_tax)
    assert_equal((a2.price + a2.price * a2.category.tax_rate).round(2), a2.price_with_tax)

    assert_equal(a2.sales_taxes, 1.5)
    assert_equal(a2.price_with_tax, 16.49)

    a3 = products :a3
    puts "a3 product price: #{a3.price}, name: #{a3.name}, tax_rate: #{a3.taxes}"
    assert_equal(a3.price, a3 .price_with_tax)

    assert_not_equal(a1.price + a2.price + a3.price, a1.price_with_tax+a2.price_with_tax+a3.price_with_tax)
    assert_equal((a1.price_with_tax + a2.price_with_tax + a3.price_with_tax).round(2), 29.83)


    puts "input 2"
    b1 = products :b1
    puts "b1 product price: #{b1.price}, name: #{b1.name}, tax_rate: #{b1.taxes}"
    assert_not_equal(b1.price, b1.price_with_tax)
    assert_equal(b1.price_with_tax, 10.5)

    b2 = products :b2
    puts "b2 product price: #{b2.price}, name: #{b2.name}, tax_rate: #{b2.taxes}"
    assert_not_equal(b2.price, b2.price_with_tax)
    assert_equal(b2.price_with_tax, 54.63)

    assert_equal((b1.price_with_tax + b2.price_with_tax).round(2), 65.13)

    puts "input 3"
    c1 = products :c1
    puts "c1 product price: #{c1.price}, name: #{c1.name}, tax_rate: #{c1.taxes}"
    assert_not_equal(c1.price, c1.price_with_tax)
    assert_equal(c1.price_with_tax, 32.19)

    c2 = products :c2
    puts "c2 product price: #{c2.price}, name: #{c2.name}, tax_rate: #{c2.taxes}"
    assert_not_equal(c2.price, c2.price_with_tax)
    assert_equal(c2.price_with_tax, 20.89)

    c3 = products :c3
    puts "c3 product price: #{c3.price}, name: #{c3.name}, tax_rate: #{c3.taxes}"
    assert_equal(c3.price, c3.price_with_tax)
    assert_equal(c3.price_with_tax, 9.75)

    c4 = products :c4
    puts "c4 product price: #{c4.price}, name: #{c4.name}, tax_rate: #{c4.taxes}"
    assert_not_equal(c4.price, c4.price_with_tax)
    assert_equal(c4.price_with_tax, 11.81)

    assert_equal((b1.price_with_tax + b2.price_with_tax).round(2), 65.13)

    puts "end testing the product's sales taxes"
  end

end
