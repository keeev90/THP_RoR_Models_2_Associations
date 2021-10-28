# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Vider les tables à chaque nouveau seed via $ rails db:seed
City.destroy_all 
Dogsitter.destroy_all 
Dog.destroy_all 
Stroll.destroy_all 

# Création des Fakers

5.times do |c|
  city = City.create!(city_name: Faker::Address.city)
end

25.times do
  dogsitter = Dogsitter.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city_id: City.ids.sample)
end

100.times do |d|
  dog = Dog.create!(name: Faker::Creature::Dog.name, city_id: City.ids.sample)
end

200.times do |s|
  stroll = Stroll.create!(
    date: Faker::Date.between(from: '2020-01-01', to: '2020-12-31'),
    dogsitter_id: Dogsitter.ids.sample,
    dog_id: Dog.ids.sample,
    city_id: City.ids.sample
  )
end


# NB : autre solution que City.ids.sample
# définir city = City.find_by(id: rand(1..City.all.length))
# puis city_id: city 