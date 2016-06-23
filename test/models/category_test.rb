require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  def category
    @category ||= Category.new
  end

  def test_valid

    assert_not category.valid?
    category.name = "Books"
    category.tax_rate = 0

    assert category.valid?
  end

  def test_category_association
    cat1 = categories :parent_a
    assert cat1.valid?

    assert_equal cat1.children.count > 0, true
  end
end
