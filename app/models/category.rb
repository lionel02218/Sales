class Category < ActiveRecord::Base
  # Table Schema
  # t.string :name
  # t.string :tax_rate
  has_many :products
end
