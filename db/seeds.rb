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
Dream.destroy_all

10.times do
dream = Dream.new(
  date: Faker::Date.between(from: 1.year.ago, to: Date.today),
  content: Faker::Lorem.paragraphs(number: 1, supplemental: true),
)
dream.save!
end

puts 'Finished!'

# TODO: add this array to labels controller
@labels = ["Nightmare", "Pregnancy", "Memory", "Ex", "Grandfather", "Sleep paralysis", "Sea", "Animal"]

# @labels = labels.each do | label |
#   label.dream
# end
# TODO: create a faker user??
