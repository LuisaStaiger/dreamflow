require 'date'

puts "Cleaning Database 🧼"
Answer.destroy_all
Label.destroy_all
DreamQuestion.destroy_all
Dream.destroy_all
Question.destroy_all
User.destroy_all

# Users
users = User.create([
  { username: "Giulia", email: "giulia@test.com", password: "123456", current_goal: "Sleep more", current_dreams: "Great", current_influences: "Stressful Bootcamp" },
  { username: "Luisa", email: "luisa@test.com", password: "123456", current_goal: "Sleep better", current_dreams: "Positive", current_influences: "Stressful Bootcamp" },
  { username: "Rebeca", email: "rebeca@test.com", password: "123456", current_goal: "Sleep more", current_dreams: "Confusing", current_influences: "Stressful Bootcamp" },
  { username: "Emma", email: "emma@test.com", password: "123456", current_goal: "Sleep more", current_dreams: "Weird", current_influences: "Stressful Teaching" },
  { username: "Adam", email: "adam@test.com", password: "123456", current_goal: "Sleep less", current_dreams: "Crazy", current_influences: "Stressful Teaching" }
  ])
puts "Creating #{User.count} Users 🙋🏼‍♀️ 🤷🏽‍♀️ 💁🏻‍♀️ 💻 🤷🏼‍♂️ 🤷🏼‍♀️"

# Dreams
def create_dreams_for(user, dream_contents)
  dream_contents.each do |content|
    Dream.create(
      date: Date.today - rand(1..365),
      content: content,
      user: user
    )
  end
end
puts "Creating Dreams 💭 💭 💭"

# Giulia's Dreams
giulia_dreams = [
  "I dreamt I was dating Bad Bunny and while I was doing perreo perreo he proposed to me.",
  "I dreamt a childhood memory. I was at the beach in my grandparents house, the sky was grey and I was feeling anxious",
  "I dreamt I was smoking again!! but after a couple of cigarette puffs I was already regretting my choice. This dream was so realistic. ",
  "I dreamt I was kicked out from Le Wagon because I forgot to do my flashcard and Pedro was furious at me",
  "I dreamt about coding, again",
  "Adam was eating spaghetti during the lecture while Pedro was dancing brazilian samba."
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
  "Dream of a night app ecosystem where messages are left for nocturnal users.",
  "A moment of connection with old friend at a table, disrupted by an interruption.",
  "Unexpected reunion on a Berlin street, followed by an emotional turmoil.",
  "A peaceful dream of old friend announcing a visit, lying in the grass.",
  "A disturbing dream of a turtle's demise, leading to an aquatic escape.",
  "Packing anxieties and anticipation of meeting my Ex, hindered by disorganization.",
  "Reflections on a birthday, a brief note from old friend, and emotional ambiguities.",
  "Visit to Ami's new place, deep conversations, fluctuating images of past and present.",
  "A frustrating experience with a Swedish class, emotions running high in a mysterious house.",
  "Walentina's alarmed look, a threat lurking in the background of my dream.",
  "Reunion with Ex, a sense of unfamiliarity in a newly discovered place.",
  "A dream visit to Tel Aviv University, amid the bustling city market.",
  "A frightening home invasion, a narrow escape to Jaffa for cleansing and relief.",
  "An unexpected email from Ex, realization of being blocked, emotions stirred.",
  "A hospital visit to Ex, unexpected anger, and the remnants of a family meal.",
  "A heart-wrenching dream of a child in peril, the intensity of parental love.",
  "Experiencing a bomb attack with friends, awakening in Ex's arms, a vivid nightmare.",
  "A dream of unexpected pregnancy, mixed reactions from loved ones, life's uncertainties."
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

puts "#{Dream.count} Dreams Created Successfully 🌌"

puts "Creating Labels 🏷️ 🏷️ 🏷️"
Label.create(
  name: "Nightmare",
  description: "A nightmare is a disturbing dream associated with negative feelings, such as anxiety or fear that awakens you. Nightmares are common in children but can happen at any age."
  )

Label.create(
  name: "Bad Bunny",
  description: "Pregnancy is the time during which one or more offspring develops (gestates) inside a woman's uterus (womb).",
  )

Label.create(
  name: "Memory",
  description: "Memory is the faculty of the mind by which data or information is encoded, stored, and retrieved when needed. It is the retention of information over time for the purpose of influencing future action.",
)

Label.create(
  name: "Anmeldung",
  description: "This could be one that formerly held a specified position or place. especially : a former spouse or former partner in an intimate relationship."
  )

Label.create(
  name: "Grandparents",
  description: "Grandparents, individually known as grandmother and grandfather, are the parents of a person's father or mother – paternal or maternal."
  )

Label.create(
  name: "Sleep paralysis",
  description: "Sleep paralysis is when you cannot move or speak as you are waking up or falling asleep. It can be scary but it's harmless and most people will only get it once or twice in their life."
  )

Label.create(
  name: "Spaghetti",
  description: "A sea is a large body of salty water. There are particular seas and the sea. The sea commonly refers to the ocean, the wider body of seawater."
  )

Label.create(
  name: "Adam",
  description: "Similarly, in dreams, animals often symbolize emotions, expression and the response of your more 'wild,' uncivilized, yet natural self. This part of your nature can be at odds with the inner critic that coaxes you toward conformity."
  )

Label.create(
  name: "Coding",
  description: "Similarly, in dreams, animals often symbolize emotions, expression and the response of your more 'wild,' uncivilized, yet natural self. This part of your nature can be at odds with the inner critic that coaxes you toward conformity."
    )

Label.create(
    name: "Naked",
    description: "Similarly, in dreams, animals often symbolize emotions, expression and the response of your more 'wild,' uncivilized, yet natural self. This part of your nature can be at odds with the inner critic that coaxes you toward conformity."
      )

puts "Creating Questions 💬 💬 💬"
questions_data = [
  {
    question: "What's the first thing I remember about my dream?",
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

DreamLabel.create(dream: Dream.last, label: Label.last)
DreamLabel.create(dream: Dream.last, label: Label.first)

puts "Ladies, we're done! 👩🏼‍💻"
