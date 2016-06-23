# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
  puts "Create Categories"
  cat1 = Category.create(name: "NotImported", tax_rate: 0)
  cat2 = Category.create(name: "Imported", tax_rate: 0.05)

  Category.create(name: "Books", tax_rate: 0, parent_id: cat1.id)
  Category.create(name: "Food", tax_rate: 0, parent_id: cat1.id)
  Category.create(name: "Medical", tax_rate: 0, parent_id: cat1.id)
  Category.create(name: "Other", tax_rate: 0.1, parent_id: cat1.id)

  Category.create(name: "Books", tax_rate: 0, parent_id: cat2.id)
  Category.create(name: "Food", tax_rate: 0, parent_id: cat2.id)
  Category.create(name: "Medical", tax_rate: 0, parent_id: cat2.id)
  Category.create(name: "Other", tax_rate: 0.1, parent_id: cat2.id)
  puts "End Create Categories"
