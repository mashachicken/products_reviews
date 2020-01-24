# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all

50.times do |index|
  product = Product.create!(name: Faker::Cannabis.cannabinoid,
    cost: Faker::Number.within(range: 1..10),
    country_of_origin: Faker::Address.country )
    product.save

    review = Review.create!(author: Faker::Cannabis.cannabinoid,
      content_body: Faker::Number.within(range: 1..10),
      rating: Faker::Number.within(range: 1..5), product_id: product.id)
      review.save

    end
    p "Created #{Product.count} products and #{Product.count} reviews"
