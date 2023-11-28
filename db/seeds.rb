Property.destroy_all
User.destroy_all
City.destroy_all
Country.destroy_all
10.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: "123456")
end

france = Country.create(name: 'France')
usa = Country.create(name: 'USA')

# Créez des villes associées à des pays
paris = City.create(name: 'Paris', country: france)
new_york = City.create(name: 'New York', country: usa)

10.times do
  Property.create!(
    title: Faker::Book.title,
    price: rand(100000...1000000000),
    description: Faker::Quotes::Shakespeare.king_richard_iii_quote,
    user_id: rand(User.first.id..User.last.id),
    superficie: rand(50..200),
    num_rooms: rand(1..5),
    furnished: [true, false].sample,
    city: [paris, new_york].sample,  # Associez la propriété à une ville aléatoire
    country: [france, usa].sample   # Associez la propriété à un pays aléatoire
  )
end