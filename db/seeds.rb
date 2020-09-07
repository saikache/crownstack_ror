# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

products = [
  { name: 'Nicon D850', description: Faker::Quote.famous_last_words, price: Faker::Bank.account_number(digits: 5).to_i, make: 2020, available_quantity: (rand(6) + 1) },
  { name: 'Nicon D780', description: Faker::Quote.famous_last_words, price: Faker::Bank.account_number(digits: 5).to_i, make: 2018, available_quantity: (rand(6) + 1) },
  { name: 'Nicon D3500', description: Faker::Quote.famous_last_words, price: Faker::Bank.account_number(digits: 5).to_i, make: 2019, available_quantity: (rand(6) + 1) },
  { name: 'Nicon D6', description: Faker::Quote.famous_last_words, price: Faker::Bank.account_number(digits: 5).to_i, make: 2020, available_quantity: (rand(6) + 1) },
  { name: 'Nicon D5600', description: Faker::Quote.famous_last_words, price: Faker::Bank.account_number(digits: 5).to_i, make: 2016, available_quantity: (rand(6) + 1) },
  { name: 'Nicon Df', description: Faker::Quote.famous_last_words, price: Faker::Bank.account_number(digits: 5).to_i, make: 2019, available_quantity: (rand(6) + 1) }
]

Product.create(products)
User.create(email: 's@s.com', password: '1234', name: 'Sagar')
