require 'faker'

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Label.destroy_all
Dream.destroy_all
User.destroy_all

user = User.new(email: "giulia@gmail.com", password: "ciao123")
user.save!

10.times do
dream = Dream.new(
  date: Faker::Date.between(from: 1.year.ago, to: Date.today),
  content: Faker::Books::Lovecraft.paragraph(sentence_count: 5),
  #content: Faker::Lorem.paragraph(sentence_count: 3),
  user: user
)
dream.save!
end

puts 'Finished!'

["Nightmare", "Pregnancy", "Memory", "Ex", "Grandfather", "Sleep paralysis", "Sea", "Animal"].each do |label|
  Label.create(name: label)
end

puts 'Finished!'
