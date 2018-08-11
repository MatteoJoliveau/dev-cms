# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(5 - Project.count).times do |n|
  project = Project.find_or_create_by!(
    name: Faker::Fallout.character,
    url: Faker::Internet.url,
    description: Faker::Lorem.paragraph,
    star: (n + 1 % 2).zero?
  )

  puts "Created project #{project.slug}"
end
