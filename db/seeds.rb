# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


# create users
20.times do
  name = Faker::Movies::HarryPotter.character
  password = "password"
  password_confirmation ="password"

  User.create(name: name, password: password, password_confirmation: password_confirmation)
end

# create event types
10.times do
  name = Faker::Verb.simple_present

  EventType.create!(name: name)
end

# create activities
10.times do
  title = Faker::TvShows::RickAndMorty.quote
  description = Faker::TvShows::RickAndMorty.quote
  start_time = Faker::Date.in_date_period(year: 2019, month: 11)
  end_time = Faker::Date.in_date_period(year: 2019, month: 11)
  event_type_id = Faker::Number.between(from: 1, to: EventType.count)
  user_id = Faker::Number.between(from: 1, to: User.count)

  Activity.create!(title: title, description: description, start_time: start_time, end_time: end_time, event_type_id: event_type_id, user_id: user_id)
end