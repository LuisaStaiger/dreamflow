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

puts "Creating User"
user = User.new(email: "giulia@gmail.com", password: "ciao123")
user.save!

puts "Creating Dreams"
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

puts "Creating Label"
["Nightmare", "Pregnancy", "Memory", "Ex", "Grandfather", "Sleep paralysis", "Sea", "Animal"].each do |label|
  Label.create(name: label)
end

puts 'Finished!'

puts "Creating Questions"

questions_data = [
  {
    question: "Did I dream last night?",
    explanation: "Start by simply asking yourself if you remember any dreams. This sets the intention to recall your dreams.",
    default: true
  },
  {
    question: "What emotions do I feel upon waking?",
    explanation: "Often, the residual emotions from a dream can help you remember details. Note any feelings you have upon waking.",
    default: true
  },
  {
    question: "Can I recall any specific images or scenes?",
    explanation: "Try to visualize any fragments of images or scenes that come to mind. Even small details can be a starting point.",
    default: true
  },
  { question: "Can I recall any specific images or scenes?",
    explanation: "Try to visualize any fragments of images or scenes that come to mind. Even small details can be a starting point.",
    default: true
  },
  {
    question: "Are there any familiar faces or characters?",
    explanation: "Pay attention to people in your dreams. Recognizing familiar faces might trigger more memories.",
    default: true
  },
  {
    question: "Where was the dream set?",
    explanation: "Focus on the location of the dream. Was it indoors, outdoors, in a familiar place, or somewhere completely new?",
    default: true
  },
  {
    question: "What was the main theme or storyline?",
    explanation: "Reflect on the overall plot or theme of the dream. Were there any specific events or a sequence of actions?",
    default: true
  },
  {
    question: "Are there any symbols or recurring themes?",
    explanation: "Think about any symbolic elements or recurring themes that may be present in your dreams.",
    default: true
  },
  {
    question: "Was the dream in color or black and white?",
    explanation: "Pay attention to the visual aspects. Remembering the colors of your dream can sometimes trigger more details.",
    default: true
  },
  {
    question: "Did I have control or awareness in the dream?",
    explanation: "Consider your level of consciousness in the dream. Were you aware that you were dreaming, and did you have any control over the events?",
    default: true
  }
]

questions_data.each do |data|
  Question.create!(
    question_text: data[:question],
    explanation_text: data[:explanation],
    default: data[:default],
    user: user
  )
end

puts "Finished!"
