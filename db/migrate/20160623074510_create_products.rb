class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :category, index: true, foreign_key: true
      t.string :name
      t.integer :quantity, default: 1
      t.float :price

      t.timestamps null: false
    end
  end
end
