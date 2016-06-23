class Category < ActiveRecord::Base
  # Table Schema
  # t.integer :parent_id
  # t.string :name
  # t.float :tax_rate
  # t.string :path

  validates_presence_of :name
  validates_presence_of :tax_rate

  has_many :children, class_name: "Category", foreign_key: :parent_id
  belongs_to :parent, class_name: "Category"

  has_many :products
end
