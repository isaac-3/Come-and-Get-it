# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

Ingredient.destroy_all
User.destroy_all
Restaurant.destroy_all
MenuItem.destroy_all
Order.destroy_all
Rating.destroy_all
Cart.destroy_all

10.times do
    Ingredient.create(name: Faker::Food.ingredient)
end

4.times do
    User.create(username: Faker::Name.first_name, password: "123")
end

5.times do
    Restaurant.create(name: Faker::Restaurant.name)
end

5.times do
    Cart.create(user_id: User.all.sample.id)
end 

20.times do
    MenuItem.create(name: Faker::Food.dish, description: Faker::Food.description, price: rand(1..25), restaurant_id: Restaurant.all.sample.id)
end

10.times do
    Order.create(user_id: User.all.sample.id, menu_item_id: MenuItem.all.sample.id, quantity: rand(1..5), order_total: 0, cart_id: Cart.all.sample.id)
end

50.times do
    Rating.create(rating: rand(1..5), menu_item_id: MenuItem.all.sample.id, user_id: User.all.sample.id)
end

# 10.times do
#     MenuItem.create(name: Faker::Food.dish, description: Faker::Food.description, price: rand(1..25), ingredient_id: Ingredient.all.sample.id, restaurant_id: Restaurant.all.sample.id)
# end