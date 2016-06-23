class Product < ActiveRecord::Base
  # Table Schema
  # t.belongs_to :category
  # t.string :name
  # t.integer :quantity default 1
  # t.float :price
  validates_presence_of :category_id
  validates_presence_of :name
  validates_presence_of :price


  belongs_to :category

  def sales_taxes
    (self.price * self.taxes).round(2)
  end

  def price_with_tax
    (self.price + self.sales_taxes).round(2)
  end

  def taxes
    category = self.category
    tax_rate = 0
    while category.parent.present? do
      tax_rate += category.tax_rate
      category = category.parent
    end
    tax_rate += category.tax_rate
    tax_rate.round(2)
  end

  def sales_info_by_json

  end
end
