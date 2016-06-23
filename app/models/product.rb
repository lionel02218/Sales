class Product < ActiveRecord::Base
  # Table Schema
  # t.belongs_to :category
  # t.string :name
  # t.integer :quantity
  # t.float :price

  belongs_to :category

  def sales_taxes
    self.price * self.category.tax_rate
  end
end
