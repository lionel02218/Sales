class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :tax_rate

      t.timestamps null: false
    end
  end
end
