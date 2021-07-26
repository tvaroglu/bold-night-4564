# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

RideMechanic.destroy_all
Mechanic.destroy_all
Ride.destroy_all

mechanic_1 = Mechanic.create!(
  name: 'Tim Taylor',
  years_of_experience: 20
)
mechanic_2 = Mechanic.create!(
  name: 'Arthur Fonzarelli',
  years_of_experience: 30
)

ride_1 = Ride.create!(
  name: 'Tilt-a-whirl',
  thrill_rating: 40,
  open: true
)
ride_2 = Ride.create!(
  name: 'Lazy River',
  thrill_rating: 10,
  open: false
)
ride_3 = Ride.create!(
  name: 'The Executioner',
  thrill_rating: 100,
  open: true
)
ride_4 = Ride.create!(
  name: 'The Screaming Oak',
  thrill_rating: 75,
  open: true
)

mechanic_1.rides << ride_1
mechanic_1.rides << ride_2
mechanic_1.rides << ride_3
