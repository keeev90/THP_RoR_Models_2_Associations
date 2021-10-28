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
Doctor.destroy_all 
Patient.destroy_all 
Appointment.destroy_all 
Specialty.destroy_all

# Table cities > à créer en premier car nous aurons besoin de récupérer ses ids dans d'autres tables (doctors, patients, appointments)
5.times do |c|
  city = City.create!(name: Faker::Address.city)
end

# Table doctors <> avoir déjà créé la table cities pour pouvoir récupérer des ids d'objet City
25.times do |d|
  doctor = Doctor.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    zip_code: Faker::Address.zip_code,
    city_id: City.ids.sample 
  )
end

# FOCUS ON :
# ids method >>> https://stackoverflow.com/questions/17103003/rails-active-record-get-ids-array-from-relation
# sample method >>> https://www.geeksforgeeks.org/ruby-array-sample-function/#:~:text=Array%23sample()%20%3A%20sample(),random%20elements%20from%20the%20array.&text=Return%3A%20a%20random%20element%20or%20n%20random%20elements%20from%20the%20array.

# Table patients <> avoir déjà créé la table cities pour pouvoir récupérer des ids d'objet City
250.times do |p|
  patient = Patient.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city_id: City.ids.sample
  )
end

# Table appointments <> avoir déjà créé les tables doctors / patients / cities pour pouvoir récupérer des ids d'objet Doctor / Patient / City
350.times do |a|
  appointment = Appointment.create!(
    date: Faker::Date.between(from: '2020-01-01', to: '2020-12-31'),
    doctor_id: Doctor.ids.sample,
    patient_id: Patient.ids.sample,
    city_id: City.ids.sample
  )
end

# Table specialties
specialties_array = ["anesthésiologie", "cardiologie", "chirurgie", "dermatologie", "gynécologie", "médecine générale", "radiologie", "pédiatrie", "psychiatrie", "orthopédie"] 

10.times do |i|
  specialty = Specialty.create!(name: specialties_array[rand(specialties_array.length)]) #tirage aléatoire d'un élément de l'array (position entre 0 et le nombre total d'éléments de l'array)
end

# Table join_doctor_specialties
100.times do
  rand_specialty_id = Specialty.find_by(id: rand(1..Specialty.all.length)) #tirage aléatoire d'un id de la table specialty parmi le nombre d'entrées de la table (en évitant l'id 0 qui n'existe pas...)
  rand_doctor_id = Doctor.find_by(id: rand(1..Doctor.all.length)) #idem

  join_doctor_specialties = JoinDoctorSpecialty.create!(doctor: rand_doctor_id, specialty: rand_specialty_id)
end
