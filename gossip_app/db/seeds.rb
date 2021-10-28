# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# Vider les tables à chaque nouveau seed via $ rails db:seed
City.destroy_all 
User.destroy_all 
Gossip.destroy_all
Tag.destroy_all 
GossipTagJoin.destroy_all
PrivateMessage.destroy_all
Comment.destroy_all 
Like.destroy_all

# Table cities
5.times do |c|
  city = City.create!(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip_code
  )
end

# Table users
100.times do |d|
  doctor = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.sentence,
    email: Faker::Internet.email,
    age: rand(18..100),
    city_id: City.ids.sample
  )
end

# FOCUS ON :
# ids method >>> https://stackoverflow.com/questions/17103003/rails-active-record-get-ids-array-from-relation
# sample method >>> https://www.geeksforgeeks.org/ruby-array-sample-function/#:~:text=Array%23sample()%20%3A%20sample(),random%20elements%20from%20the%20array.&text=Return%3A%20a%20random%20element%20or%20n%20random%20elements%20from%20the%20array.

# Table gossips
200.times do
  gossip = Gossip.create!(
    title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraph,
    user_id: User.ids.sample
  )
end

# Table tags
10.times do
  tag = Tag.create!(title: Faker::Color.color_name)
end

# Table gossip_tag_joins
100.times do
  rand_gossip_id = Gossip.find_by(id: rand(1..Gossip.all.length)) #tirage aléatoire d'un id de la table gossips parmi le nombre d'entrées de la table (en évitant l'id 0 qui n'existe pas...)
  rand_tag_id = Tag.find_by(id: rand(1..Tag.all.length)) #idem

  gossip_tag_join = GossipTagJoin.create!(gossip: rand_gossip_id, tag: rand_tag_id)
end

# Table private_messages
#t.text "content"
#t.integer "sender_id"
#t.integer "recipient_id"

# Table comments
20.times do
  comment = Comment.create!(
    content: Faker::Lorem.sentence,
    gossip_id: Gossip.ids.sample,
    user_id: User.ids.sample
  )
end

# Table likes
50.times do
  like = Like.create!(
    user_id: User.ids.sample,
    comment_id: Comment.ids.sample,
    gossip_id: Gossip.ids.sample
  )
end