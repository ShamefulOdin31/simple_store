# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
"""for i in 0..676
  new = Product.create(
    :title => Faker::Commerce.product_name,
    :price => Faker::Commerce.price,
    :stock_qauntity => Faker::Number.number(digits: 2)
  )
  new.save
end
"""

Product.destroy_all

Category.destroy_all

csv_file = Rails.root + "db/products.csv"

products = SmarterCSV.process(csv_file)

products.each do |product|
  category = Category.find_or_create_by(name: product[:category])
  category.save

  products = category.products.create(
    title:          product[:name],
    price:          product[:price],
    stock_qauntity: product[:stock_quantity]
  )
  products.save!
end
