require 'date'

puts "Cleaning Database 🧼"
Answer.destroy_all
Label.destroy_all
DreamQuestion.destroy_all
Dream.destroy_all
Question.destroy_all
User.destroy_all

puts "Creating Users 🙋🏼‍♀️ 🤷🏼‍♀️ 🤷🏽‍♀️ 💁🏻‍♀️"
users = User.create([
  { username: "Giulia", email: "giulia@test.com", password: "123456" },
  { username: "Luisa", email: "luisa@test.com", password: "123456" },
  { username: "Rebeca", email: "rebeca@test.com", password: "123456" },
  { username: "Emma", email: "emma@test.com", password: "123456" },
  { username: "Adam", email: "adam@test.com", password: "123456" }
])

puts "Creating Dreams 💭 💭 💭"
def create_dreams_for(user, dream_contents)
  dream_contents.each do |content|
    Dream.create(
      date: Date.today - rand(1..365),
      content: content,
      user: user
    )
  end
end

# Giulia's Dreams
giulia_dreams = [
  "I found myself lost in a labyrinthine sea, with waves whispering ancient tales.",
  "In a dream, I was pregnant, feeling both joy and anxiety about the future.",
  "I revisited a cherished memory with my grandfather in his old fishing boat.",
  "I was being chased by a shadowy figure, an embodiment of my deepest fears.",
  "My pet dog spoke to me, revealing secrets of a hidden animal kingdom."
]

# Luisa's Dreams
luisa_dreams = [
  "I experienced a terrifying nightmare where I was lost in an endless, dark forest.",
  "I dreamt of being an astronaut, exploring the mysteries of the sea from space.",
  "In my dream, I was in school again, but all my classmates were figures from my past.",
  "I had a dream where I couldn't move, trapped in my bed by an unseen force.",
  "I was at a grand gathering of animals, each one representing a part of my personality."
]

# Rebeca's Dreams
rebeca_dreams = [
  "I dreamt of a peaceful pregnancy, surrounded by a serene sea under the moonlight.",
  "A vivid memory of my childhood home came to life, filled with laughter and joy.",
  "I found myself in a nightmare, where I was being pursued by an unknown menace.",
  "I was swimming with dolphins, understanding their language and feeling at peace.",
  "In my dream, my grandfather visited me, offering wisdom and guidance."
]

# Emma's Dreams
emma_dreams = [
  "I was in a school of fish, learning the secrets of the sea as one of them.",
  "In a nightmare, I was trapped in a mirror maze, facing reflections of my past.",
  "I dreamt of a joyous moment, feeling the kick of my unborn child.",
  "I found an old journal of my grandfather, unlocking memories of his adventurous life.",
  "I experienced sleep paralysis, feeling a mysterious presence in my room."
]

# Adam's Dreams
adam_dreams = [
  "I dreamt of a great sea voyage, navigating through uncharted waters with my grandfather.",
  "In a nightmarish scenario, I was being chased by a pack of wild animals.",
  "I revisited a memory of my first love, feeling both nostalgia and a sense of loss.",
  "I was a bird, soaring high above the clouds, feeling an incredible sense of freedom.",
  "I dreamt of being pregnant, which left me pondering the mysteries of life."
]

create_dreams_for(users[0], giulia_dreams)
create_dreams_for(users[1], luisa_dreams)
create_dreams_for(users[2], rebeca_dreams)
create_dreams_for(users[3], emma_dreams)
create_dreams_for(users[4], adam_dreams)

puts "Dreams Created Successfully 🌌"

puts "Creating Label"
["Nightmare", "Pregnancy", "Memory", "Ex", "Grandfather", "Sleep paralysis", "Sea", "Animal"].each do |label|
  Label.create(name: label)
end

puts "Creating Questions 💬 💬 💬"
questions_data = [
  {
    question: "Did I dream last night?",
    explanation: "Start by simply asking yourself if you remember any dreams. This sets the intention to recall your dreams.",
    original: true
  },
  {
    question: "What emotions do I feel upon waking?",
    explanation: "Often, the residual emotions from a dream can help you remember details. Note any feelings you have upon waking.",
    original: true
  },
  {
    question: "Can I recall any specific images or scenes?",
    explanation: "Try to visualize any fragments of images or scenes that come to mind. Even small details can be a starting point.",
    original: true
  },
  {
    question: "Are there any familiar faces or characters?",
    explanation: "Pay attention to people in your dreams. Recognizing familiar faces might trigger more memories.",
    original: true
  },
  {
    question: "Where was the dream set?",
    explanation: "Focus on the location of the dream. Was it indoors, outdoors, in a familiar place, or somewhere completely new?",
    original: true
  },
  {
    question: "What was the main theme or storyline?",
    explanation: "Reflect on the overall plot or theme of the dream. Were there any specific events or a sequence of actions?",
    original: true
  },
  {
    question: "Are there any symbols or recurring themes?",
    explanation: "Think about any symbolic elements or recurring themes that may be present in your dreams.",
    original: true
  },
  {
    question: "Was the dream in color or black and white?",
    explanation: "Pay attention to the visual aspects. Remembering the colors of your dream can sometimes trigger more details.",
    original: true
  },
  {
    question: "Did I have control or awareness in the dream?",
    explanation: "Consider your level of consciousness in the dream. Were you aware that you were dreaming, and did you have any control over the events?",
    original: true
  }
]

questions_data.each do |data|
  Question.create!(
    question_text: data[:question],
    explanation_text: data[:explanation],
    original: data[:original],
    user: User.last
  )
end

puts "Finished!"
