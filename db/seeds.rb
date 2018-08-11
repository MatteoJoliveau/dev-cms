# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

file_path = Rails.root.join('spec/fixtures/files/rails-logo.png')
(10 - Project.count).times do |n|
  project = Project.find_or_initialize_by(
    name: Faker::Fallout.character,
    url: Faker::Internet.url,
    description: Faker::Lorem.paragraph,
    star: ((n + 1) % 2).zero?
  )
  image = File.open(file_path)
  project.image.attach(io: image, filename: 'rails-logo.png')
  project.save!
  puts "Created project #{project.slug}"
end
