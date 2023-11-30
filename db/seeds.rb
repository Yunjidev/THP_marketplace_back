Property.destroy_all
User.destroy_all
City.destroy_all
Country.destroy_all

# Création d'utilisateurs
10.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: "123456"
  )
end

# Création de pays européens
european_countries = [
  'Austria', 'Belgium', 'Bulgaria', 'Croatia', 'Cyprus', 'Czech Republic',
  'Denmark', 'Estonia', 'Finland', 'France', 'Germany', 'Greece', 'Hungary',
  'Ireland', 'Italy', 'Latvia', 'Lithuania', 'Luxembourg', 'Malta', 'Netherlands',
  'Poland', 'Portugal', 'Romania', 'Slovakia', 'Slovenia', 'Spain', 'Sweden', 'Senegal', 'Maroc', 'Brazil'
]

european_countries.each do |country_name|
  Country.find_or_create_by(name: country_name)
end

# Création de villes associées à des pays
countries = Country.all
cities = []

countries.each do |country|
  cities << City.create(name: Faker::Address.city, country: country)
end

# Création de propriétés
10.times do
  Property.create!(
    title: Faker::Book.title,
    price: rand(100_000...1_000_000_000),
    description: Faker::Quotes::Shakespeare.king_richard_iii_quote,
    user: User.all.sample,
    superficie: rand(50..200),
    num_rooms: rand(1..5),
    furnished: [true, false].sample,
    city: cities.sample,
    country: countries.sample
  )
end
